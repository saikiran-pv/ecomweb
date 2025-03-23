class AddRoleUsers < ActiveRecord::Migration[7.0]
  def change
    add_column :users, :address, :string
    add_column :users, :phone_number, :integer
    add_column :users, :role, :string, default: "user"
  end
end
