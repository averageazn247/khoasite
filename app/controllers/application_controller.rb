class ApplicationController < ActionController::Base
  protect_from_forgery
  include SessionsHelper
  def set_current_user
      User.current = current_user
    end
  # Force signout to prevent CSRF attacks
  def handle_unverified_request
    sign_out
    super
  end
end
