class Category < ApplicationRecord
    has_many :products

    def to_param
        category_name
    end
end
