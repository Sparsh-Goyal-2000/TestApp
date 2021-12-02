class SubscriptionUser < ApplicationRecord

  belongs_to :subscription
  belongs_to :user

  validate :ensure_users_within_limit
  validate :ensure_user_is_not_an_active_subscriber

  scope :enabled, -> { where enabled: true }

  def disable
    update_column(:enabled, false)
  end

  private def ensure_users_within_limit
    errors.add(:base, 'Users limit has reached') if SubscriptionUser.where(subscription_id: subscription_id).count >= USERS_LIMIT
  end

  private def ensure_user_is_not_an_active_subscriber
    errors.add(:base, 'User already has an active subscription') if user.has_active_subscription_on?(subscription.start_date)
  end

end
