class AddColumnToBranchProducts < ActiveRecord::Migration[6.1]
  def change
    change_table :branch_products do |t|
      t.remove :status
      t.boolean :is_available, default: true
    end
  end
end
