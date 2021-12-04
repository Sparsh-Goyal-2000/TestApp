class Coaching < ApplicationRecord
  self.inheritance_column = :sports_type

  has_many :batches, dependent: :restrict_with_error
  has_many :registrations, through: :batches
  has_many :players, through: :registrations

  validates :head_name, :sports_type, presence:  true

end
