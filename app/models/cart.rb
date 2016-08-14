# == Schema Information
#
# Table name: carts
#
#  id         :integer          not null, primary key
#  user_id    :integer
#  created_at :datetime         not null
#  updated_at :datetime         not null
#

class Cart < ApplicationRecord
  belongs_to :user
  has_many :products, through: :cart_product
  has_many :cart_products, dependent: :destroy

  def add(product_id)
    cart_product ||= CartProduct.find_or_create_by(cart_id: id, product_id: product_id)
    amount = cart_product.amount + 1
    cart_product.update(amount: amount)
  end

  def remove(product_id)
    cart_product = CartProduct.where(cart_id: id, product_id: product_id).take
    amount = cart_product.amount - 1 unless amount == 0
    cart_product.update(amount: amount)
  end

  def total_price
    total = 0
    cart_products.each do |cart_item|
      total += cart_item.product.price.to_f*cart_item.amount
    end
    total
  end

  def clear
    cart_products.each do |cart_item|
      cart_item.amount = 0
      cart_item.save
    end
  end

  def total_cost
    total = 0
    cart_products.each do |cart_item|
      total += cart_item.product.cost.to_f*cart_item.amount
    end
    total
  end

end
