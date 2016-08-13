class OrderController < ApplicationController
  def index
    @orders = Order.find_all
  end

  def new
    order = Order.new(order_params)
    buyer = Buyer.find_or_create_by(params[:buyer_id])

  end

  def show
  end

  private

  def order_params
    params.require(:order).permit(:shipping_cost, :packaging_cost)
  end
end
