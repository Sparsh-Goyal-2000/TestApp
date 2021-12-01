class Reservation < ApplicationRecord

  belongs_to :branch
  belongs_to :customer

  has_and_belongs_to_many :tables
  has_many :line_items, dependent: :destroy

  validates :start_at, :end_at, :person_count, presence: true
  validate :ensure_start_at_less_than_end_at

  before_validation :book_tables

  scope :active, -> { where("start_at <= :current_time && end_at >= :current_time", current_time: DateTime.current) }

  def update_total
    update_column(:total_amount_in_cents, line_items.sum("buying_price_in_cents * quantity"))
  end

  def total_amount
    total_amount_in_cents / 100.0
  end

  def book_tables
    return if person_count.nil?

    people = person_count
    if people >= 15
      branch.tables.where(capacity: 15).each do |table|
        if table.vacant_for?(self)
          tables << table
          people -= 15
        end
        break if people < 15
      end
    end
    if people >= 10
      branch.tables.where(capacity: 10).each do |table|
        if table.vacant_for?(self)
          tables << table
          people -= 10
        end
        break if people < 10
      end
    end
    if people >= 6
      branch.tables.where(capacity: 6).each do |table|
        if table.vacant_for?(self)
          tables << table
          people -= 6
        end
        break if people < 6
      end
    end
    if people >= 4
      branch.tables.where(capacity: 4).each do |table|
        if table.vacant_for?(self)
          tables << table
          people -= 4
        end
        break if people < 4
      end
    end
    if people >= 1
      branch.tables.where(capacity: 2).each do |table|
        if table.vacant_for?(self)
          tables << table
          people -= 2
        end
        break if people <= 0
      end
    end
    errors.add(:base, 'Tables not available') if people > 0
  end

  private def ensure_start_at_less_than_end_at
    errors.add(:base, 'Start at must be less than end at') if start_at >= end_at
  end
end
