class UsersController < ApplicationController
	before_action :set_post , only: [:destroy]
  skip_before_action :ensure_login , only: [:new , :create]
  skip_before_action :ensure_admin , only: [:new , :create , :show , :edit , :update]

	def index
		@allUsers = User.all 
	end

  def new
    if session[:user_id] && current_user.account_type != "admin"
      redirect_to root_path
    end  	
    @user = User.new
  end

  def edit
    @my_user = current_user
  end

  def update
    @my_user = current_user
    @old_password = params[:user][:Old_Password]
    @new_password = params[:user][:password]
    unless @old_password==""
      if @my_user.authenticate(@old_password)
        @my_user.update(password: @new_password)
        flash[:notice] = "Password updated successfully" unless @new_password==""
      else
        flash[:notice] = "Unable to update password"
      end
    end
    if @my_user.update(user_edit_params)
      redirect_to edit_user_path(@my_user)
    else
      render :edit , object: @my_user
    end
  end

  def create
  	@user = User.new(user_params)
  	if @user.save
  		acc_type = User.find_by(email: params[:user][:email])
  		acc_type.account_type = "normal"
  		acc_type.save
      if current_user && current_user.account_type=="admin"
        redirect_to admin_index_path , notice: "New user created successfully"
      else
  		  session[:user_id] = acc_type.id
        redirect_to root_path , notice: "logged in successfully"
      end

  	else
  		render :new
  	end
  end

  def show
    @orders = current_user.orders.order(id: :desc).all 
  end

  def destroy
  	if @my_user.destroy
  		flash[:notice]= "Successfully deleted"
  	else
  		flash[:notice]= "Not Deleted"
  	end
    redirect_to root_path, status: :see_other
  end

  private 

  	def user_params
  		params.require(:user).permit(:name,:email,:address,:phone,:password)
  	end

    def user_edit_params
      params.require(:user).permit(:name,:email,:address,:phone)
    end

  	def set_post
  		@my_user = User.find_by(id: params[:id]) 
  	end
end