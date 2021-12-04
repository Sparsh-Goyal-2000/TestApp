class CreateBatches < ActiveRecord::Migration[6.1]
  def change
    create_table :batches do |t|
      t.references :branch
      t.references :coaching
      t.string :coach_name
      t.integer :players_limit
      t.integer :players_count
      t.integer :start_at_in_HH
      t.integer :end_at_in_HH
      t.timestamps
    end
  end
end
