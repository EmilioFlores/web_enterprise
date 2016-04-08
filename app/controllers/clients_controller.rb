class ClientsController < ApplicationController

	def index
		
	end

	def show
		@client = Client.find(params[:id])
	end

	def new
		@client = Client.new
	end

	def edit
		@client = Client.find(params[:id])
	end

	def create
		@client = Client.new(client_params)
		if @client.save
			redirect_to client_path(@client)
		else 
			render :new
		end
	end

	def update
		@client = Client.find(params[:id])

		if @client.update_attributes(client_params)
			redirect_to @client, notice: 'Client was successfully updated.'
		else
			render action: "edit"
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
			:client_since,
			spouses_attributes: [:first_name, 
								 :second_name, 
								 :last_name,
								 :second_last_name,
								 :birth_date,
								 :married_date,
								 :gender]
		)
	end

end