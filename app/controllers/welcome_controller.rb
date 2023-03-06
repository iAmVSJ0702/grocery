class WelcomeController < ApplicationController
  skip_before_action :ensure_login
  skip_before_action :ensure_admin
  
  def index
  end
end
