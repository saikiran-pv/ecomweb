class AddAddressType < ActiveRecord::Migration[7.0]
  def change
    add_column :addresses, :address_type, :string
  end
end
