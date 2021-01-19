class Item < ApplicationRecord
  belongs_to       :user
  has_one          :order
  has_one_attached :image

  extend ActiveHash::Associations::ActiveRecordExtensions
  belongs_to :category
  belongs_to :condition
  belongs_to :shipping_cost
  belongs_to :prefecture
  belongs_to :days_to_ship

  with_options presence: true do
    validates :name
    validates :text 
    validates :image
    validates :price, numericality: {only_integer: true, greater_than_or_equal_to: 300, less_than_or_equal_to: 9999999}
  end
  with_options presence: true , numericality: { other_than: 1 }  do
    validates :category_id
    validates :condition_id
    validates :shipping_cost_id
    validates :prefecture_id
    validates :days_to_ship_id
  end
end
