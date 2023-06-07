class AddLogoToStore < ActiveRecord::Migration[7.0]
  def change
    add_column :stores, :logo, :string
  end
end
