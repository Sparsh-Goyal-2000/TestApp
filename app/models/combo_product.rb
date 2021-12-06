class ComboProduct < ApplicationRecord

  belongs_to :combo, class_name: :Product
  belongs_to :product

  validates :quantity, presence: true

end
