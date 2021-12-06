class ChangeKindFromProducts < ActiveRecord::Migration[6.1]
  def change
    reversible do |dir|
      dir.up do
        add_column :products, :new_kind, :integer, default: 0
        Product.where(kind: 'Food').update_all(new_kind: 0)
        Product.where(kind: 'Drink').update_all(new_kind: 1)
        Product.where(kind: 'Combo').update_all(new_kind: 2)
        remove_column :products, :kind, :string
        rename_column :products, :new_kind, :kind
      end

      dir.down do
        add_column :products, :new_kind, :string
        Product.where(kind: 0).update_all(new_kind: 'Food')
        Product.where(kind: 1).update_all(new_kind: 'Drink')
        Product.where(kind: 2).update_all(new_kind: 'Combo')
        remove_column :products, :kind, :integer
        rename_column :products, :new_kind, :kind
      end
    end
  end
end
