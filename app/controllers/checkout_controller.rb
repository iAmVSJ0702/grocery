class CheckoutController < ApplicationController
  def create
    @order = Order.new(order_params)
  
    if @order.save
      # redirect to the order confirmation page
    else
      # redirect back to the cart page with an error message
    end
  end
  
  private
  
  def order_params
    params.require(:order).permit(:name, :email, :address, :phone)
  end
end
