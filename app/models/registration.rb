class Registration < ApplicationRecord

  belongs_to :player
  belongs_to :batch, counter_cache: :players_count
  has_one :coaching, through: :batch
  has_one :branch, through: :batch

  validates :month_name, presence: true
  validate :ensure_unique_coaching_in_one_branch, :ensure_unique_time, :ensure_batch_is_not_full

  before_validation :set_month, on: :create

  private def set_month
    self.month_name = Date.current.strftime("%B")
  end

  private def ensure_unique_coaching_in_one_branch
    return unless batch && player

    if player.batches.exists?(branch: branch, coaching: coaching)
      errors.add(:base, 'Player can atmost enroll to one batch of a particular sport in a particular branch')
    end
  end

  private def ensure_unique_time
    return unless batch && player

    if player.batches.exists?(start_at_in_HH: batch.start_at_in_HH, end_at_in_HH: batch.end_at_in_HH)
      errors.add(:base, 'Player can atmost enroll to one batch at a particular timing')
    end
  end

  private def ensure_batch_is_not_full
    return unless batch

    if batch.players_count >= batch.players_limit
      errors.add(:base, 'Batch full for the current month, try later')
    end
  end
end
