class CreateJoinTableReservationsTables < ActiveRecord::Migration[6.1]
  def change
    create_join_table :reservations, :tables do |t|
      t.index :reservation_id
      t.index :table_id
    end
  end
end
