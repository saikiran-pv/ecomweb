class CreateCategories < ActiveRecord::Migration[7.0]
  def change
    create_table :categories do |t|
      t.timestamps
      t.string "category_name"
      t.string "description"
    end
  end
end
