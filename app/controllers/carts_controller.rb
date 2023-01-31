class CartsController < ApplicationController

  skip_before_action :ensure_admin

  def index
  end

  def create
  	@itemNumber = params[:format]
  	@cartItem = Cart.new
  	@cartItem.save
  	@theItem = Item.find_by(id: @itemNumber)
  	@theItem.carts << @cartItem
  	current_user.carts << @cartItem
  	redirect_to carts_path , notice: "Item successfully added"
  end

  def update
  	itemsInCartOfUser = Cart.where(user_id: current_user.id)
  	itemToDelete = itemsInCartOfUser.find_by(item_id: params[:id])
  	itemToDelete.destroy
  	redirect_to carts_path , notice: "A item was removed"
  end

  def edit
    cart = Cart.where(user_id: current_user.id)
    itemsToDelete = cart.where(item_id: params[:id])
    itemsToDelete.each do |t|
      t.destroy
    end
    redirect_to carts_path , notice: "Item removed successfully"
  end

  def destroy
  	itemsToBuy = current_user.my_cart_items
    if itemsToBuy==[]
      redirect_to carts_path
    else
    	itemIds = itemsToBuy.pluck :id
    	current_user.items << itemsToBuy
      address = params[:daddress]
      if params[:daddress]==""
        address= current_user.address
      end
      current_order = current_user.orders.create(daddress: address)
      itemsToBuy.each do |item|
        current_item = current_order.OrderedItems.create(title: item.title , price: item.price , description: item.description, quantity: Cart.quantity(item.id,current_user.id))
        current_item.save!
        item.OrderedItems << current_item
      end
      current_user.carts.destroy_all
    	redirect_to user_path(current_user.id) , notice: "Your Order with id #{current_order.id} was placed successfully"
    end
  end
end
