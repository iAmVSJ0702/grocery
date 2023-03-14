class CartController < ApplicationController
  skip_before_action :ensure_admin

  def show
    @render_cart = false
    @orders = @cart.orderables.all 
  end

  def add
    @message = "successfully added to cart"
    @url = cart_url
    @item = Item.find_by(id: params[:id])
    quantity = params[:quantity].to_i
    current_orderable = @cart.orderables.find_by(item_id: @item.id)
    if current_orderable && quantity > 0
      current_orderable.update(quantity:)
    elsif quantity > 0
      @cart.orderables.create(item: @item, quantity:)
    else
      @message = "Quantity of item was left blank, please enter a valid number"
      @url = item_path(@item)
    end
      redirect_to @url, notice: @message
  end

  def remove
    Orderable.find_by(id: params[:id]).destroy
    redirect_to cart_path
  end
end
