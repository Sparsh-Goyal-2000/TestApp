class Branch < ApplicationRecord

  has_many :coachings, dependent: :restrict_with_error
  has_many :batches, through: :coachings
  has_many :sports, through: :coachings
  has_many :registrations, through: :batches
  has_many :players, through: :registrations

  validates :name, :email, :address, presence: true
  validates :name, :email, uniqueness: { case_sensitive: false }, allow_blank: true

end
