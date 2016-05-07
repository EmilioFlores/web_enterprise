class CalendarController < ApplicationController
	before_filter :check_session
	before_action :find_clients, :find_policies, only: [:index]

	def index
		respond_to do |format|
			format.json { render :json => { birth_dates: @clients.to_json,
											policies: @policies.to_json }} 
			format.html {}
		end
	end

	def show
	end

	private

	def find_clients
		@clients ||= current_user.clients
	end

	def find_policies
		client_ids = @clients.pluck(:id)
		@policies ||= Policy.where(client_id: client_ids)
	end

end
