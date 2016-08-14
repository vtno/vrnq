class OrdersController < ApplicationController
  before_action :find_order, only: [:show, :edit, :destroy]
  def index
    @orders = Order.all
  end

  def show
  end

  def edit
  end

  def destroy
    if @order.destroy
      flash[:notice] = 'Order deleted'
    else
      flash[:alert] = 'Fail to delete order'
    end
    redirect_to orders_path
  end
  def create
   total_price = order_params[:full_price].to_i + order_params[:shipping_cost].to_i + order_params[:packaging_cost].to_i - order_params[:discount].to_i
   order = Order.new(order_params.merge({total_price: total_price}))
   order.total_cost = order.total_cost + order_params[:shipping_cost].to_i + order_params[:packaging_cost].to_i
   if order.save
     current_user.cart.cart_products.each do |item|
       OrderProduct.create(product_id: item.product.id, order_id: order.id, amount: item.amount)
     end
   end
   current_user.cart.clear
   current_user.cart.save
   redirect_to orders_path, notice: 'Order created'
  end

  private

  def order_params
    params.require(:order).permit(:buyer_name, :shipping_cost, :packaging_cost, :description, :full_price, :total_cost, :discount)
  end

  def find_order
    @order = Order.find(params[:id])
  end
end
