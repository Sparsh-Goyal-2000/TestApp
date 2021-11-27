class CreateProduct < ActiveRecord::Migration[6.1]
  def change
    create_table :products do |t|
      t.string :name
      t.string :category
      t.decimal :price, precision: 6, scale: 2

      t.timestamps
    end
  end
end
