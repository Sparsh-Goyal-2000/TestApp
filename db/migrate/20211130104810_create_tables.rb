class CreateTables < ActiveRecord::Migration[6.1]
  def change
    create_table :tables do |t|
      t.references :branch
      t.integer :capacity

      t.timestamps
    end
  end
end
