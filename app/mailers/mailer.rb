# encoding: utf-8

class Mailer < ActionMailer::Base
  default from: "weg@gounod.berlin"

  # Subject can be set in your I18n file at config/locales/en.yml
  # with the following lookup:
  #
  #   en.mailer.login.subject
  #
  def login(user)
    @user = user
    @greeting = "Hallo #{user.short_name}"
    mail to: user.email
  end
end
