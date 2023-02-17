class AdminController < ApplicationController
  def index
  	@newItem = Item.new
    @allUsers = User.all
    @allOrders = Order.order(id: :desc).all
  end

  def update
  	if current_user && current_user[:account_type] == "admin"
  		pass = params[:oldpassword]
  		if current_user.authenticate(pass)
  			newpass = params[:user][:password]
  			current_user.update(password: newpass)
  			redirect_to admin_index_path , notice: "Password changed successfully"
  		else
  			redirect_to admin_index_path , notice: "Password not changed"
  		end
  	end
  end

  def fetch_category_subcategories
		category = Category.find_by(id: params[:category_code])
		@subcategories = category.subcategories.all
  end
end
