class CreateReservation < ActiveRecord::Migration[6.1]
  def change
    create_table :reservations do |t|
      t.references :branch
      t.references :customer
      t.integer :person_count
      t.datetime :booking_schedule
      t.integer :tables_booked, default: 0
      t.integer :total_amount, default: 0

      t.timestamps
    end
  end
end
