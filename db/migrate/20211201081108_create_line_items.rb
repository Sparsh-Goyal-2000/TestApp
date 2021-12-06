class CreateLineItems < ActiveRecord::Migration[6.1]
  def change
    create_table :line_items do |t|
      t.references :order
      t.references :product
      t.integer :quantity
      t.integer :unit_price_in_cents

      t.timestamps
    end
  end
end
