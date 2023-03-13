class RemoveCartRefInLineItem < ActiveRecord::Migration[7.0]
  def change
    remove_reference :line_items, :cart
    add_column :orders, :stripe_charge_id, :string
    add_column :orders, :payment_status, :string
  end
end
