# Welcome controller. Serves as the user's dashboard
class WelcomeController < ApplicationController
  def home
  		redirect_to new_user_session_path unless current_user
  		
  	
  end
end
