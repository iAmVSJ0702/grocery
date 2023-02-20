class ApplicationController < ActionController::Base
  protect_from_forgery with: :exception
  before_action :ensure_login
  before_action :ensure_admin
  before_action :set_render_cart
  before_action :initialize_cart
  helper_method :logged_in? , :current_user , :is_admin?

  def set_render_cart
    @render_cart = true
  end

  def initialize_cart
    @cart ||= Cart.find_by(id: session[:cart_id])

    if @cart.nil?
      @cart =  Cart.create
      session[:cart_id] = @cart.id
    end
  end

  protected
  	def ensure_login
  		redirect_to login_path unless session[:user_id]
  	end

    def ensure_admin
      redirect_to items_path unless User.find_by(id: session[:user_id])[:account_type] == "admin"
    end

    def is_admin?
      User.find_by(id: session[:user_id])[:account_type] == "admin" if logged_in?
    end

  	def logged_in?
  		session[:user_id]
  	end

  	def current_user
  		User.find_by(id: session[:user_id])
  	end
end
