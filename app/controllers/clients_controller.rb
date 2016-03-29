class ClientsController < ApplicationController

	def index
		
	end

	def show
		@client = Client.find(params[:id])
	end

	def new
		@client = Client.new
	end

	def create
		@client = Client.new(client_params)
		if @client.save
			redirect_to client_path(@client)
		else 
			render :new
		end
	end

	private
	def client_params
		params.require(:client).permit(
			:first_name,
			:second_name,
			:last_name,
			:second_last_name,
			:birth_date,
			:gender,
			:email,
			:phone_number,
			:cellphone_number,
			:has_kids,
			:is_vip,
			:client_since
		)
	end

end