# == Schema Information
#
# Table name: orders
#
#  id             :integer          not null, primary key
#  shipping_cost  :decimal(, )
#  packaging_cost :decimal(, )
#  description    :text
#  buyer_name     :string
#  created_at     :datetime         not null
#  updated_at     :datetime         not null
#  total_price    :decimal(, )
#  total_cost     :decimal(, )
#  discount       :decimal(, )
#  full_price     :decimal(, )
#

class Order < ActiveRecord::Base
  belongs_to :user
  has_many :products, through: :order_product
  has_many :order_products

  scope :by_year, -> (year) { where("extract( YEAR FROM created_at) = ?", year) }
  scope :by_month, -> (month) { where("extract( MONTH FROM created_at) = ?", month) }

end
