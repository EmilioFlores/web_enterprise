class ApplicationController < ActionController::Base
  # Prevent CSRF attacks by raising an exception.
  # For APIs, you may want to use :null_session instead.
  protect_from_forgery with: :exception

  before_action :set_session_locale 

  def set_session_locale
    I18n.locale = user_signed_in? ? current_user.locale.to_sym : 
      I18n.default_locale
  end


  def check_session
    redirect_to new_user_session_path unless current_user
  end

end
