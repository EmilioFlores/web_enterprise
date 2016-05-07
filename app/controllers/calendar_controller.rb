class CalendarController < ApplicationController

	def index
		respond_to do |format|
			format.json { render :json => { birth_dates: Client.all.to_json,
											policies: Policy.all.to_json }} 
			format.html {}
		end
	end

	def show
	end

end
