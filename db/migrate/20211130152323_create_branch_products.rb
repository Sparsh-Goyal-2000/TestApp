class CreateBranchProducts < ActiveRecord::Migration[6.1]
  def change
    create_table :branch_products do |t|
      t.references :branch
      t.references :product
      t.integer :price_in_cents
      t.string :status, default: 'available'

      t.timestamps
    end
  end
end
