class Registration < ApplicationRecord

  belongs_to :player
  belongs_to :batch, counter_cache: :players_count
  has_one :coaching, through: :batch
  has_one :sport, through: :coaching
  has_one :branch, through: :coaching

  validates :month_name, presence: true
  validate :ensure_unique_sport_in_one_branch, :ensure_unique_time, :ensure_batch_is_not_full

  before_validation :set_month, on: :create

  private def set_month
    self.month_name = Date.current.strftime("%B")
  end

  private def ensure_unique_sport_in_one_branch
    return unless batch && player

    return if persisted? && !player_id_changed? && !batch_id_changed?

    if persisted?
      if player.registrations.where.not(id: id).any? { |registration| registration.coaching == coaching }
        errors.add(:base, 'Player can atmost enroll to one batch of a particular sport in a particular branch')
      end
    else
      if player.coachings.exists?(coaching.id)
        errors.add(:base, 'Player can atmost enroll to one batch of a particular sport in a particular branch')
      end
    end
  end

  private def ensure_unique_time
    return unless batch && player

    return if persisted? && !player_id_changed? && !batch_id_changed?

    if persisted?
      if player.registrations.where.not(id: id).any? { |registration| registration.batch.start_at < batch.end_at && registration.batch.end_at > batch.start_at }
        errors.add(:base, 'Player can atmost enroll to one batch at a particular timing')
      end
    else
      if player.batches.where("start_at < ? && end_at > ?", batch.end_at, batch.start_at).exists?
        errors.add(:base, 'Player can atmost enroll to one batch at a particular timing')
      end
    end
  end

  private def ensure_batch_is_not_full
    return unless batch && batch.players_limit?

    if batch.players_count >= batch.players_limit
      errors.add(:base, 'Batch full for the current month, try later')
    end
  end
end
