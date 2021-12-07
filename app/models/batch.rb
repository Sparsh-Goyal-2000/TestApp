class Batch < ApplicationRecord

  MIN_PLAYERS = 10

  belongs_to :coaching
  has_one :branch, through: :coaching
  has_one :sport, through: :coaching
  has_many :registrations, dependent: :restrict_with_error
  has_many :players, through: :registrations

  validates :coach, :start_at, :end_at, presence: true
  validates :players_count, numericality: {
    only_integer: true,
    greater_than_or_equal_to: 0
  }, allow_nil: true
  validates :players_limit, numericality: {
    only_integer: true,
    greater_than_or_equal_to: MIN_PLAYERS
  }, allow_nil: true
  validate :ensure_start_at_less_than_end_at

  private def ensure_start_at_less_than_end_at
    return unless start_at? && end_at?

    errors.add(:base, 'Start at must be less than end at') unless start_at < end_at
  end

end
