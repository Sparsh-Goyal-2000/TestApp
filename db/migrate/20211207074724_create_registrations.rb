class CreateRegistrations < ActiveRecord::Migration[6.1]
  def change
    create_table :registrations do |t|
      t.references :player
      t.references :batch
      t.string :month_name
      t.timestamps
    end
  end
end
