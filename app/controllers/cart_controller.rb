class CartController < ApplicationController
  skip_before_action :ensure_admin

  def show
    @render_cart = false
  end

  def add
    @item = Item.find_by(id: params[:id])
    quantity = params[:quantity].to_i
    current_orderable = @cart.orderables.find_by(item_id: @item.id)
    if current_orderable && quantity > 0
      current_orderable.update(quantity:)
    elsif quantity <= 0
      current_orderable.destroy
    else
      @cart.orderables.create(item: @item, quantity:)
    end
      redirect_to cart_url, notice: "successfully added to cart"
  end

  def remove
    Orderable.find_by(id: params[:id]).destroy
    redirect_to cart_path
  end
end
