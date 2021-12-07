class Sport < ApplicationRecord

  has_many :coachings, dependent: :restrict_with_error
  has_many :batches, through: :coachings
  has_many :branches, through: :coachings
  has_many :registrations, through: :batches
  has_many :players, through: :registrations

  validates :name, :team_size, presence: true
  validates :name, uniqueness: { case_sensitive: false }, allow_blank: true
  validates :team_size, numericality: {
    only_integer: true,
    greater_than: 0
  }, allow_nil: true

end
