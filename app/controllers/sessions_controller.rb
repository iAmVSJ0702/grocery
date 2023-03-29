# frozen_string_literal: true

# This is SessionsController
class SessionsController < ApplicationController
  skip_before_action :ensure_signin, only: %i[new create]
  skip_before_action :ensure_admin
  skip_before_action :verify_authenticity_token, only: [:destroy]

  def new
    return unless session[:user_id]

    redirect_to root_path
  end

  def create
    email = params[:user][:email].downcase
    my_user = User.find_by(email:)
    pass = params[:user][:password]
    p "test 1 #{email}"
    if session[:user_id].nil?
      if my_user&.authenticate(pass)
        session[:user_id] = my_user.id
        redirect_to root_path
      else
        redirect_to signin_path, notice: 'Incorrect email address or password'
      end
    else
      redirect_to root_path, alert: "Already Logged in as #{current_user.name}"
    end
  end

  def destroy
    if session[:user_id].nil?
      redirect_to signin_path, notice: 'You have already been logged out'
    else
      reset_session
      redirect_to signin_path, notice: 'You have been logged out successfully'
    end
  end
end
