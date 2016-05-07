# Welcome controller. Serves as the user's dashboard
class WelcomeController < ApplicationController
  def home
  	return redirect_to new_user_session_path unless current_user
    # return redirect_to user_disabled_path unless current_user.enable?
  end

  def user_disabled
  end
end
