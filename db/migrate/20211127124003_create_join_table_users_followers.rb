class CreateJoinTableUsersFollowers < ActiveRecord::Migration[6.1]
  def change
    create_join_table :followers, :followings do |t|
      t.index :follower_id
      t.index :following_id
    end
  end
end
