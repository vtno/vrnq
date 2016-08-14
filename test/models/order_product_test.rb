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

require 'test_helper'

class OrderProductTest < ActiveSupport::TestCase
  # test "the truth" do
  #   assert true
  # end
end
