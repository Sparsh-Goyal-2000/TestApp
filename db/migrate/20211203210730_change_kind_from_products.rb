class ChangeKindFromProducts < ActiveRecord::Migration[6.1]
  def change
    reversible do |dir|
      dir.up do
        Product.where(kind: 'Food').update_all(kind: 0)
        Product.where(kind: 'Drink').update_all(kind: 1)
        Product.where(kind: 'Combo').update_all(kind: 2)
        change_column :products, :kind, :integer, default: 0
      end

      dir.down do
        change_column :products, :kind, :string
      end
    end
  end
end
