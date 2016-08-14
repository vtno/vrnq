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

require 'test_helper'

class OrderTest < ActiveSupport::TestCase
  # test "the truth" do
  #   assert true
  # end
end
