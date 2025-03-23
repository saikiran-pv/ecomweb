class AddStoreNameToUsers < ActiveRecord::Migration[7.0]
  def change
    add_reference :users, :store
  end
end
