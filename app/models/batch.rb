class Batch < ApplicationRecord

  belongs_to :branch
  belongs_to :coaching
  has_many :registrations, dependent: :restrict_with_error
  has_many :players, through: :registrations

  validates :coach_name, :players_limit, :start_at_in_HH, :end_at_in_HH, presence:  true
  validates :players_limit, :players_count, numericality: {
    only_integer: true,
    greater_than_or_equal_to: 0
  }, allow_nil: true
  validate :ensure_start_at_less_than_end_at

  private def ensure_start_at_less_than_end_at
    return unless start_at_in_HH && end_at_in_HH

    errors.add(:base, 'Start at must be less than end at') unless start_at_in_HH < end_at_in_HH
  end

end
