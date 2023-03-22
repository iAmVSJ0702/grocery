# frozen_string_literal: true

# This is CheckoutController
class CheckoutController < ApplicationController
  def create
    @order = Order.new(order_params)
    @order.save
  end

  private

  def order_params
    params.require(:order).permit(:name, :email, :address, :phone)
  end
end
