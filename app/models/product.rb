class Product < ActiveRecord::Base
  has_many :orders, through: :order_product
  has_many :order_products

  validates :name, presence: true
  validates :price, presence: true
  validates :stock, presence: true
  validates :cost, presence: true
end
