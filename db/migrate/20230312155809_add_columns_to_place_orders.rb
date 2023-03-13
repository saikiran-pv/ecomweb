class AddColumnsToPlaceOrders < ActiveRecord::Migration[7.0]
  def change
    remove_column :orders, :stripe_charge_id
    remove_column :orders, :payment_status
    add_column :orders, :delivery_address, :string
    add_column :orders, :card_number, :integer
    add_column :orders, :cvv, :integer
    add_column :orders, :expiry_date, :integer
  end
end
