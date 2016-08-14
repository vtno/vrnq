class OrderProduct < ActiveRecord::Base
  belongs_to :product
  belongs_to :order

  validates :order_id, presence: true
  validates :product_id, presence: true
end
