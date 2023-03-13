class CreateAddresses < ActiveRecord::Migration[7.0]
  def change
    create_table :addresses do |t|
      t.references :user, null: false, foreign_key: true
      t.string :house
      t.string :area
      t.string :city
      t.integer :zipcode
      t.string :country

      t.timestamps
    end
  end
end
