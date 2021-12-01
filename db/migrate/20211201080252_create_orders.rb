class CreateOrders < ActiveRecord::Migration[6.1]
  def change
    create_table :orders do |t|
      t.references :restaurant
      t.references :customer
      t.integer :total_amount_in_cents

      t.timestamps
    end
  end
end
