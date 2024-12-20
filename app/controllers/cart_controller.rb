# frozen_string_literal: true

class CartController < ApplicationController
  skip_before_action :ensure_admin

  def show
    @render_cart = false
    @orders = orderables
  end

  def add
    @message = 'successfully added to cart'
    @url = cart_url
    @item = Item.find_by(id: params[:id])
    quantity = params[:quantity].to_i
    current_orderable = orderables.find_by(item_id: @item.id)
    if current_orderable && quantity.positive?
      current_orderable.update(quantity:)
    elsif quantity.positive?
      create_orderable(@item, quantity)
    else
      @message = 'Quantity of item was left blank, please enter a valid number'
      @url = item_path(@item)
    end
    redirect_to @url, notice: @message
  end

  def remove
    Orderable.find(params[:id]).destroy
    redirect_to cart_url
  end

  private

  def orderables
    @cart.orderables.all
  end

  def create_orderable(item, quantity)
    @cart.orderables.create(item:, quantity:)
  end
end
