class Branch < ApplicationRecord

  has_many :batches, dependent: :restrict_with_error
  has_many :coachings, through: :batches
  has_many :registrations, through: :batches
  has_many :players, through: :registrations

  validates :name, :email, :address, presence:  true
  validates :name, :email, uniqueness: { case_sensitive: false }

end
