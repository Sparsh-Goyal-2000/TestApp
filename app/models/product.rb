class Product < ApplicationRecord

  has_many :branches, class_name: :BranchProduct 
  has_many :line_items, dependent: :restrict_with_error

  validates :name, presence: true, uniqueness: true

end
