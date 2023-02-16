class AddStoreIdToProducts < ActiveRecord::Migration[7.0]
  def change
    add_reference :products, :store
    rename_column :stores, :name, :store_name
    rename_column :roles, :name, :role_name
  end
end
