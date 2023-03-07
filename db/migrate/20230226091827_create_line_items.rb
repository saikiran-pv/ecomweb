class CreateLineItems < ActiveRecord::Migration[7.0]
  def change
    create_table :line_items do |t|
      t.references :product, foreign_key: true
      t.references :order, foreign_key: true
      t.references :cart, foreign_key: true
      t.integer "quantity", default: 1
      t.decimal "price", precision: 10, scale: 2
      t.timestamps
    end
    add_column :orders, :total_price, :decimal, precision: 10, scale: 2

  end
end
