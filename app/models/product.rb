class Product < ActiveRecord::Base
  has_many :orders, through :order_product
  has_many :order_products
end
