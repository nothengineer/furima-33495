class Order < ApplicationRecord
  has_one :addresse   
  belongs_to :user      
  belongs_to :item
end
