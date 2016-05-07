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
    return redirect_to new_user_session_path unless current_user
    return redirect_to admin_index_path if current_user.admin?
    return redirect_to user_disabled_path unless current_user.enabled?
  end

  def check_admin
    redirect_to destroy_user_session_path unless current_user.admin?
  end
end
