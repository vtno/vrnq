class ProductsController < ApplicationController
  def index
    @products = Product.all
    @order = Order.new
  end

  def new
    @product = Product.new
  end

  def add_to_order
    product = Product.find(params[:id])
    if session[:order_items].blank?
      order_items = Array.new(1, product)
    else
      order_items = session[:order_items]
      order_items.push(product)
    end
    session[:order_items] = order_items
    redirect_to products_path, notice: 'Added product to order'
  end

  def edit
    @product = Product.find(params[:id])
  end

  def update
    product =Product.find(params[:id])
    if product.update(product_params)
      redirect_to products_path, notice: 'Product updated'
    else
      redirect_to products_path, alert: 'Fail to update product'
    end
  end

  def destroy
    product = Product.find(params[:id])
    if product.destroy
      flash[:notice] = "Product deleted"
    else
      flash[:alert] ="Cannot delete product"
    end
    redirect_to products_path
  end

  def create
    @product = Product.new(product_params)
    if @product.save
      flash[:notice] = 'Product created!'
    else
      flash[:alert] =  'Missing parameter. Try again'
    end
    redirect_to products_path
  end

  private

  def product_params
    params.require(:product).permit(:name, :price, :stock, :cost, :description)
  end
end
