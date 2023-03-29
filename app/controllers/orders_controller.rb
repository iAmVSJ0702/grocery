# frozen_string_literal: true

# This is OrdersController
class OrdersController < ApplicationController
  skip_before_action :ensure_admin

  def index
    @orders = Order.where(email: current_user.email)
    @user = current_user
  end

  def new
    @order = Order.new
    @user = current_user
    @orderable_count = @cart.orderables.count
  end

  def create
    @order = Order.new(order_params)
    @order.save
    @user = current_user
    @cart.orderables.each do |orderable|
      @ordered_item = OrderedItem.create(
        item_id: orderable.item_id,
        order_id: @order.id,
        quantity: orderable.quantity
      )
    end
    redirect_to order_path(@order)
    @cart.orderables.destroy_all
  end

  def show
    @order = Order.find(params[:id])
    @user = current_user
  end

  def destroy
    Order.find(params[:id]).destroy
    redirect_to orders_path, notice: 'Order Cancelled'
  end

  private

  def order_params
    params.require(:order).permit(:name, :email, :address, :phone, :cart_id, ordered_items_attributes: %i[id product_id quantity _destroy])
  end
end
