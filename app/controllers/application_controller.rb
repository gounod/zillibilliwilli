# encoding: utf-8

require "application_responder"

# encoding: utf-8

class ApplicationController < ActionController::Base
  self.responder = ApplicationResponder
  respond_to :html, :js

  before_action :logged_in_per_email

  # Prevent CSRF attacks by raising an exception.
  # For APIs, you may want to use :null_session instead.
  protect_from_forgery with: :exception

  def logged_in_per_email
    if params[:auth_token].present? && current_user.present?
      flash[:notice] = "Sie wurden erfolgreich angemeldet"
      current_user.save
    end
    if params[:auth_token].present? && current_user.blank?
      flash[:notice] = "Ihr Anmeldelink ist leider nicht mehr gültig. Bitte senden Sie sich einen neuen Link zu"
      redirect_to "/users/sign_in"
    end
  end

end
