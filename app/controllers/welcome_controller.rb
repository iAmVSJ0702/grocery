# frozen_string_literal: true

# This is WelcomeController
class WelcomeController < ApplicationController
  skip_before_action :ensure_signin
  skip_before_action :ensure_admin

  def index; end
end
