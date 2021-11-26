class CreateCoupon < ActiveRecord::Migration[6.1]
  def change
    create_table :coupons do |t|
      t.string :code
      t.text :description
      t.date :expiry_date
      t.integer :status
      t.references :user
      t.timestamps
    end
  end
end
