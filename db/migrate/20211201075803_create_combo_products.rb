class CreateComboProducts < ActiveRecord::Migration[6.1]
  def change
    create_table :combo_products do |t|
      t.references :combo
      t.references :product
      t.integer :quantity

      t.timestamps
    end
  end
end
