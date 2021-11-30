class Table < ApplicationRecord

  belongs_to :branch
  has_and_belongs_to_many :reservations

  def vacant?
    !reservations.active.exists?
  end

  def vacant_for?(new_reservation)
    reservations.each do |reservation|
      return false if reservation.start_at <= new_reservation.end_at && reservation.end_at >= new_reservation.start_at
    end
    return true
  end

end
