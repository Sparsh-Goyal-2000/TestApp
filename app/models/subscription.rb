class Subscription < ApplicationRecord
  
  belongs_to :owner, class_name: :User
  belongs_to :plan
  has_many :subscription_users
  has_many :users, through: :subscription_users

  validates :start_date, presence: true
  validate :ensure_user_is_not_an_active_subscriber

  before_create :set_expiry_date

  after_create_commit :add_owner_to_users

  def active_on?(date)
    start_date <= date && expiry_date >= date
  end

  def remaining_days
    (expiry_date - Date.today).to_i
  end

  private def ensure_user_is_not_an_active_subscriber
    errors.add(:base, 'User already has an active subscription') if owner.has_active_subscription_on?(start_date)
  end

  private def set_expiry_date
    self.expiry_date = start_date + plan.duration_in_days
  end

  private def add_owner_to_users
    users << owner
  end

end
