class Customer < ApplicationRecord

  has_many :reservations, dependent: :destroy

  validates :name, :email, presence: true
  validates :email, uniqueness: true
end
