class AddAttrToProds < ActiveRecord::Migration[7.0]
  def change
    add_column :products, :code, :integer
    add_reference :products, :category
  end
end
