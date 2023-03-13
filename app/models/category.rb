class Category < ApplicationRecord
    has_many :products

        
    validates :category_name, :uniqueness => { :message => "Category already exists" }
    validates :description, :presence => { :message => "Add a description" }

    def to_param
        category_name
    end
end
