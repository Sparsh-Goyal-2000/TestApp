class User < ApplicationRecord

  has_many :owned_subscriptions, class_name: :Subscription, foreign_key: :owner_id, dependent: :restrict_with_error

  has_and_belongs_to_many :subscriptions

  validates :name, :email, presence: true
  validates :email, uniqueness: { case_sensitive: false }

  def active_subscription?
    subscriptions.each do |subscription|
      return true if subscription.active?
    end
    false
  end
end
