class CalendarController < ApplicationController
	before_filter :check_session
	before_action :find_modules, only: [:index]
	def index
		respond_to do |format|
			format.json { render :json => { birth_dates: @clients.to_json,
											policies: @policies.to_json,
											spouses: @spouses.to_json,
											offspring: @offspring.to_json }} 
			format.html {}
		end
	end

	def show
	end

	private


	def find_modules 
		@clients ||= current_user.clients
		client_ids = @clients.pluck(:id)
		@policies ||= Policy.where(client_id: client_ids)
		@offspring ||= Offspring.where(client_id: client_ids)
		@spouses ||= Spouse.where(client_id: client_ids)
	end
	
end
