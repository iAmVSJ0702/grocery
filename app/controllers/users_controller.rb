# frozen_string_literal: true

# This is UsersController
class UsersController < ApplicationController
  before_action :set_post, only: [:destroy]
  skip_before_action :ensure_signin, only: %i[new create]
  skip_before_action :ensure_admin, only: %i[new create show edit update]

  def index
    @all_users = User.all
  end

  def new
    redirect_to root_path if session[:user_id] && current_user.account_type != 'admin'
    @user = User.new
  end

  def edit
    @user = current_user
  end

  def update
    @user = current_user
    @old_password = params[:user][:Old_Password]
    @new_password = params[:user][:password]
    unless @old_password == ''
      if @user.authenticate(@old_password)
        @user.update(password: @new_password)
        flash[:notice] = 'Password updated successfully' unless @new_password == ''
      else
        flash[:notice] = 'Unable to update password'
      end
    end
    if @user.update(user_edit_params)
      redirect_to edit_user_path(@user)
    else
      render :edit, object: @user
    end
  end

  def show
    @user = current_user
  end
  def create
    @name = params[:name]
    @email = params[:email]
    @phone = params[:phone]
    @address = params[:address]
    @password = params[:password]
    @user = User.new(user_params)
    if @user.save
      acc_type = User.find_by(email: params[:user][:email])
      acc_type.account_type = 'normal'
      acc_type.save
      if current_user && current_user.account_type == 'admin'
        redirect_to admin_index_path, notice: 'New user created successfully'
      else
        session[:user_id] = acc_type.id
        redirect_to root_path, notice: 'logged in successfully'
      end
    else
      render :new, status: :unprocessable_entity
    end
  end

  def destroy
    @user.destroy
    redirect_to root_path, status: :see_other
  end

  private

  def user_params
    params.require(:user).permit(:name, :email, :address, :phone, :password, :password_confirmation)
  end

  def user_edit_params
    params.require(:user).permit(:name, :email, :address, :phone)
  end

  def set_post
    @user = User.find(params[:id])
  end
end
