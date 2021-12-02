class RenamePriceOfPlans < ActiveRecord::Migration[6.1]
  def change
    rename_column :plans, :price, :price_in_cents
  end
end
