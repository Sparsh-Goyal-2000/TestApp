class User < ApplicationRecord

  has_many :owned_subscriptions, class_name: :Subscription, foreign_key: :owner_id, dependent: :restrict_with_error

  has_many :subscription_users
  has_many :subscriptions, through: :subscription_users

  validates :name, :email, presence: true
  validates :email, uniqueness: { case_sensitive: false }

  def has_active_subscription_on?(date)
    subscriptions.inject(false) do |active, subscription|
      active || subscription.active_on?(date)
    end
    active
  end

end
