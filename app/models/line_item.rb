class LineItem < ApplicationRecord

  belongs_to :reservation
  belongs_to :product

  validates :quantity, presence: true
end
