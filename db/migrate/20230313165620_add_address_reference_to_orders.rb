class AddAddressReferenceToOrders < ActiveRecord::Migration[7.0]
  def change
    remove_column :orders, :delivery_address
    add_reference :orders, :address
  end
end
