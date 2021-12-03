class CreateBranches < ActiveRecord::Migration[6.1]
  def change
    create_table :branches do |t|
      t.string :address
      t.string :contact

      t.timestamps
    end
  end
end
