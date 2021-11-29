class Plan < ApplicationRecord

  has_many :subscriptions, dependent: :restrict_with_error

  validates :name, :duration, :price, presence: true
  validates :name, uniqueness: { case_sensitive: false }
end
