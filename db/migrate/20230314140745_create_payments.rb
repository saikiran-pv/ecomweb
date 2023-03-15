class CreatePayments < ActiveRecord::Migration[7.0]
  def change
    create_table :payments do |t|
      t.integer :card_number
      t.integer :cvv
      t.date :expiry_date

      t.timestamps
    end
    add_reference :payments, :order
  end
end
