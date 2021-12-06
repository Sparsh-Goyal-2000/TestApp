class Category < ApplicationRecord

  belongs_to :restaurant
  has_many :products, -> { order(:position) }, dependent: :restrict_with_error

  validates :name, :position, presence: true
  validates :name, uniqueness: { case_sensitive: false }, allow_blank: true
  validates :position, numericality: {
    only_integer: true,
    greater_than: 0
  }, allow_nil: true

end
