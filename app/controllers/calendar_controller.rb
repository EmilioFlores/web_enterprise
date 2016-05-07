class CalendarController < ApplicationController

	def index
		respond_to do |format|
			format.json { render :json => Client.all.to_json }
			format.html {}
		end
	end

	def show
	end

end
