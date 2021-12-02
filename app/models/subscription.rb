class Subscription < ApplicationRecord
  
  belongs_to :owner, class_name: :User
  belongs_to :plan
  has_many :subscription_users, dependent: :destroy
  has_many :users, through: :subscription_users
  has_many :enabled_subscription_users, -> { enabled }, class_name: :SubscriptionUser
  has_many :enabled_users, through: :enabled_subscription_users, source: :user

  validates :start_date, :expiry_date, presence: true
  validate :ensure_user_is_not_an_active_subscriber
  validate :ensure_start_date_less_than_expiry_date

  before_validation :set_expiry_date

  after_create :add_owner_to_users

  def active_on?(date)
    start_date <= date && expiry_date >= date
  end

  def remaining_days
    expiry_date > Date.today ? (expiry_date - Date.today).to_i : 0
  end

  private def ensure_user_is_not_an_active_subscriber
    return unless owner

    errors.add(:base, 'User already has an active subscription') if owner.has_active_subscription_on?(start_date)
  end

  def ensure_start_date_less_than_expiry_date
    return unless start_date && expiry_date
    errors.add(:base, 'Expiry Date can not be less than Start Date') if expiry_date < start_date
  end

  private def set_expiry_date
    return unless plan && start_date

    self.expiry_date = start_date + plan.duration_in_days
  end

  private def add_owner_to_users
    users << owner
  end

end
