class CreateRelations < ActiveRecord::Migration[6.1]
  def change
    create_table :relations do |t|
      t.references :follower
      t.references :following

      t.timestamps
    end
  end
end
