class Plan < ApplicationRecord

  has_many :subscriptions, dependent: :restrict_with_error

  validates :name, :duration_in_days, :price_in_cents, presence: true
  validates :name, uniqueness: { case_sensitive: false }
  validates :duration_in_days, :price_in_cents, numericality: {
    only_integer: true,
    greater_than: 0
  }, allow_nil:  true

  def price
    price_in_cents / 100.0
  end

end
