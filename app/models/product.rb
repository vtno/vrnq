# == Schema Information
#
# Table name: products
#
#  id          :integer          not null, primary key
#  name        :string
#  price       :decimal(, )
#  stock       :integer
#  cost        :decimal(, )
#  description :text
#  created_at  :datetime         not null
#  updated_at  :datetime         not null
#

class Product < ActiveRecord::Base
  has_many :orders, through: :order_product
  has_many :order_products
  has_many :cart_products
  has_many :carts, through: :cart_product
  
  validates :name, presence: true
  validates :price, presence: true
  validates :stock, presence: true
  validates :cost, presence: true
end
