class CreateSubscriptions < ActiveRecord::Migration[6.1]
  def change
    create_table :subscriptions do |t|
      t.references :owner
      t.references :plan
      t.date :expiry_date

      t.timestamps
    end
  end
end
