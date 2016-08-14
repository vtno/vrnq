class ProductsController < ApplicationController
  def index
    @products = Product.all
    @order = Order.new
    @cart = current_user.cart
    @cart ||= Cart.create(user_id: current_user.id)
  end

  def new
    @product = Product.new
  end

  def remove_from_order
    if current_user.cart.present?
      current_user.cart.remove(params[:id])
    end
  rescue ActiveRecord::RecordNotFound
    redirect_to products_path, alert: 'There is no such product'
  end

  def add_to_order
    cart = current_user.cart
    if cart.present?
      cart.add(params[:id])
    else
      cart = Cart.new()
      if cart.save
        cart.add(params[:id])
      end
    end
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
