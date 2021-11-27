class CreateBranch < ActiveRecord::Migration[6.1]
  def change
    create_table :branches do |t|
      t.string :address
      t.numeric :contact
      t.integer :vacant_tables, default: 25

      t.timestamps
    end
  end
end
