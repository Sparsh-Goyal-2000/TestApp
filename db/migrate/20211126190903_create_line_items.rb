class CreateLineItems < ActiveRecord::Migration[6.1]
  def change
    create_table :line_items do |t|
      t.references :reservation
      t.references :branch_product
      t.integer :quantity
      t.integer :buying_price_in_cents

      t.timestamps
    end
  end
end
