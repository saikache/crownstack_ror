class UsersController < ApplicationController
  before_action :authenticate_user, except: [:create]

  # POST /api/users/cart
  def cart
    if current_user.cart_items.present?
      products = current_user.cart_items.map(&:product_details)
      render_success(products)      
    else
      error_response('No products available in cart')
    end
  end

  # POST /api/users
  def create
    user = User.new(user_params)
    if user.save
      render_success(UserSerializer.new user)
    else
      error_response(user.errors.full_messages.join(', '))
    end
  end
 
  private

    def user_params
      params.require(:user).permit(:name, :password, :email)
    end
end
