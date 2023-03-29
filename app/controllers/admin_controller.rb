# frozen_string_literal: true

# This is AdminController
class AdminController < ApplicationController
  def index
    @new_item = Item.new
    @all_users = User.all
  end

  def update
    return unless current_user && current_user[:account_type] == 'admin'
    pass = params[:oldpassword]
    if current_user.authenticate(pass)
      new_pass = params[:user][:password]
      current_user.update(password: new_pass)
      redirect_to admin_index_path, notice: 'Password changed successfully'
    else
      redirect_to admin_index_path, notice: 'Password not changed'
    end
  end

  def fetch_category_subcategories
    category = Category.find_by(id: params[:category_code])
    @subcategories = category.subcategories.all
  end
end
