class ProductsController < ApplicationController
  before_action :authenticate_user, only: [:index, :add_to_cart]
  before_action :set_product, only: [:add_to_cart]

  # GET /api/products
  def index
    products = Product.all
    render_success(ActiveModelSerializers::SerializableResource.new(products))
  end

  def add_to_cart
    # fetch user cart items & check if the product already available in the cart
    user_cart_item = Cart.find_or_create_by(user_id: current_user.id).cart_items
    if user_cart_item.pluck(:product_id).include?(params[:id].try(:to_i))
      error_response('Item already available in cart')
      # Add product to cart only when stock is available
    elsif @product.available_quantity?
      new_cart_item = user_cart_item.build(product_id: params[:id]) 
      if new_cart_item.save
        @product.update_attributes(available_quantity: @product.available_quantity - 1)
        render_success('Product added to cart successfully')
      else
        error_response(new_cart_item.errors.full_messages.join(', '))
      end
    else
      render_success('Out of stock')
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_product
      @product = Product.find_by(id: params[:id])
      error_response('Product not found') unless @product
    end

    # Only allow a trusted parameter "white list" through.
    def product_params
      params.require(:product).permit(:name, :description, :price, :make, :available_quantity)
    end
end
