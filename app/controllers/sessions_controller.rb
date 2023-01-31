class SessionsController < ApplicationController


	skip_before_action :ensure_login , only: [:new , :create]
  skip_before_action :ensure_admin
  skip_before_action :verify_authenticity_token , only: [:destroy]
  
  def new
  	if session[:user_id]
  		redirect_to root_path
  	end
  end

  def create
    email = params[:user][:email].downcase
  	myUser = User.find_by(email: email)
	  pass = params[:user][:password]

    p "test 1 #{email}"
    if session[:user_id].nil?
    	if myUser && myUser.authenticate(pass)
    		session[:user_id] = myUser.id
    		redirect_to root_path 
    	else
    		redirect_to login_path , notice: "Invalid password/email"
    	end
    else
      redirect_to root_path , alert: "Already Logged in as #{current_user.name}"
    end
  end

  def destroy
    if session[:user_id].nil?
      redirect_to login_path , notice: "You have already been logged out"
    else
    	reset_session
    	redirect_to login_path , notice: "You have been logged out successfully"
    end
  end
end
