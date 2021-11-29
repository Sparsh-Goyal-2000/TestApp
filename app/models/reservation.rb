class Reservation < ApplicationRecord

  belongs_to :branch
  belongs_to :customer
  has_many :line_items, dependent: :destroy, after_add: :update_total

  validates :booking_schedule, presence: true

  before_validation :book_tables

  def update_total(line_item)
    update_column(:total_amount, total_amount||0 + line_item.product.price * line_item.quantity )
  end

  def book_tables
    required_tables = person_count / 4
    required_tables += 1 if person_count % 4 > 0
    if required_tables <= branch.vacant_tables
      self.tables_booked = required_tables
      branch.update_column(:vacant_tables, branch.vacant_tables-required_tables)
    else
      errors.add(:base, 'Tables not available in this branch')
    end
  end

end
