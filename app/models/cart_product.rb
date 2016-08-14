# == Schema Information
#
# Table name: cart_products
#
#  id         :integer          not null, primary key
#  cart_id    :integer
#  product_id :integer
#  amount     :integer          default(0)
#  created_at :datetime         not null
#  updated_at :datetime         not null
#

class CartProduct < ApplicationRecord
  belongs_to :cart
  belongs_to :product
end
