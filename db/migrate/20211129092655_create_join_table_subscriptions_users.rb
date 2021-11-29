class CreateJoinTableSubscriptionsUsers < ActiveRecord::Migration[6.1]
  def change
    create_join_table :subscriptions, :users do |t|
      t.index :subscription_id
      t.index :user_id
    end
  end
end
