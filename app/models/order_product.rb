# == Schema Information
#
# Table name: order_products
#
#  id         :integer          not null, primary key
#  created_at :datetime         not null
#  updated_at :datetime         not null
#  order_id   :integer
#  product_id :integer
#

class OrderProduct < ActiveRecord::Base
  belongs_to :product
  belongs_to :order

  validates :order_id, presence: true
  validates :product_id, presence: true
end
