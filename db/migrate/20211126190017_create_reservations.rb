class CreateReservations < ActiveRecord::Migration[6.1]
  def change
    create_table :reservations do |t|
      t.references :branch
      t.references :customer
      t.integer :person_count
      t.datetime :start_at
      t.datetime :end_at
      t.integer :total_amount_in_cents

      t.timestamps
    end
  end
end
