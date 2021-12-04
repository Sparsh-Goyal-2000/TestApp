class Player < ApplicationRecord

  has_many :registrations, dependent: :destroy
  has_many :batches, through: :registrations
  has_many :coachings, through: :batches
  has_many :branches, through: :batches

  validates :name, :email, presence:  true
  validates :email, uniqueness: { case_sensitive: false }
  validates :age, numericality: {
    only_integer: true,
    greater_than: 10
  }, allow_nil: true

end
