class CreateBatches < ActiveRecord::Migration[6.1]
  def change
    create_table :batches do |t|
      t.references :coaching
      t.string :coach
      t.integer :players_limit
      t.integer :players_count
      t.time :start_at
      t.time :end_at
      t.timestamps
    end
  end
end
