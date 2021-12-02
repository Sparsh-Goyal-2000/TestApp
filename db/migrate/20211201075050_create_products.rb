class CreateProducts < ActiveRecord::Migration[6.1]
  def change
    create_table :products do |t|
      t.string :name
      t.text :description
      t.integer :price_in_cents
      t.string :kind
      t.boolean :is_available, default: true
      t.boolean :in_stock, default: true
      t.integer :position
      t.references :category

      t.timestamps
    end
  end
end
