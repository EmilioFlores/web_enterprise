class CalendarController < ApplicationController
	before_filter :check_session

	def index
		respond_to do |format|
			format.json { render :json => current_user.clients.to_json }
			format.html {}
		end
	end

	def show
	end

end
