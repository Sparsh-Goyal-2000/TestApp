class Player < ApplicationRecord

  AGE_LIMIT = 10

  has_many :registrations, dependent: :destroy
  has_many :batches, through: :registrations
  has_many :coachings, through: :batches
  has_many :sports, through: :coachings
  has_many :branches, through: :coachings

  validates :name, :email, presence: true
  validates :email, uniqueness: { case_sensitive: false }, allow_blank: true
  validates :age, numericality: {
    only_integer: true,
    greater_than: AGE_LIMIT
  }, allow_nil: true

end
