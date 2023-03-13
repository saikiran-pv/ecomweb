class Store < ApplicationRecord
    has_many :products
    
    validates :store_name, :uniqueness => { :message => "already exists" }
    validates :description, :presence => { :message => " needs to be filled" }
end


