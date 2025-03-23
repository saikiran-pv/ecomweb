class AddRatingToProduct < ActiveRecord::Migration[7.0]
  def change
    add_column :products, :rating, :decimal, precision: 6, scale: 1
  end
end
