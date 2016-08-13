class Order < ActiveRecord::Base
  belongs_to :buyer
  has_many :products, through: :order_product
  has_many :order_products
end
