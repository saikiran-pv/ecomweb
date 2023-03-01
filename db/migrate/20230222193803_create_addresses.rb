class CreateAddresses < ActiveRecord::Migration[7.0]
  def change
    add_column :roles, :role_number, :integer
  end
end
