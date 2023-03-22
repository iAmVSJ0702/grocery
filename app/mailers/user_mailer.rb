# frozen_string_literal: true

# This is UserMailer
class UserMailer < ApplicationMailer
  # Subject can be set in your I18n file at config/locales/en.yml
  # with the following lookup:
  #
  #   en.user_mailer.welcome.subject
  #
  def welcome
    @greeting = 'Hi'

    mail to: 'vsj0702@gmail.com'
  end
end
