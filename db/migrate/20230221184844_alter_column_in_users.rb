class AlterColumnInUsers < ActiveRecord::Migration[7.0]
  def change
    remove_reference :users, :role
  end
end
