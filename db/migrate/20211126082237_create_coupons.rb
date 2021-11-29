class CreateCoupons < ActiveRecord::Migration[6.1]
  def change
    create_table :coupons do |t|
      t.string :code
      t.text :description
      t.datetime :start_at
      t.datetime :expire_at
      t.string :status
      t.references :user
      t.timestamps
    end
  end
end
