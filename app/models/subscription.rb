class Subscription < ApplicationRecord
  
  belongs_to :owner, class_name: :User
  belongs_to :plan
  has_and_belongs_to_many :users, before_add: :check_limits

  before_create :check_active_subscriptions
  before_create :set_expiry_date

  after_create_commit :add_owner_to_users

  private def check_active_subscriptions
    if owner.active_subscription?
      errors.add(:base, 'User already has an active subscription')
      throw :abort
    end
  end

  private def set_expiry_date
    self.expiry_date = Date.today + plan.duration
  end

  private def add_owner_to_users
    users << owner
  end

  private def check_limits(user)
    throw :abort if users.count == 4
    throw :abort if user.active_subscription?
  end

  def active?
    expiry_date >= Date.today
  end

  def remaining_days
    (expiry_date - Date.today).to_i
  end
end
