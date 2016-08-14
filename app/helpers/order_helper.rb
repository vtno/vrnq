module OrderHelper
  def total_price(order)

  end
  
  def cal_rev(order)
    order.total_price.to_i - order.total_cost.to_i
  end
end
