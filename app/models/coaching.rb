class Coaching < ApplicationRecord

  belongs_to :branch
  belongs_to :sport
  has_many :batches, dependent: :restrict_with_error
  has_many :registrations, through: :batches
  has_many :players, through: :registrations

  validates :head_coach, presence: true

end
