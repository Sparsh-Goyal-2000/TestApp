class CreateSubscriptionUsers < ActiveRecord::Migration[6.1]
  def change
    create_table :subscription_users do |t|
      t.references :subscription
      t.references :user
      t.boolean :enabled, default: true

      t.timestamps
    end
  end
end
