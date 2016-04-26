# == Schema Information
#
# Table name: clients
#
#  id               :integer          not null, primary key
#  user_id          :integer
#  marital_status   :integer          default(0)
#  first_name       :string
#  second_name      :string
#  last_name        :string
#  second_last_name :string
#  birth_date       :datetime
#  gender           :integer
#  email            :string
#  phone_number     :string
#  cellphone_number :string
#  has_kids         :boolean          default(FALSE)
#  is_vip           :boolean          default(FALSE)
#  client_since     :datetime
#  deleted_at       :datetime
#  created_at       :datetime         not null
#  updated_at       :datetime         not null
#  client_prospect  :boolean          default(FALSE)
#  client           :boolean          default(FALSE)
#

class ClientsController < ApplicationController
	before_filter :check_session

	def index
		@clients = current_user.clients.real_clients
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
			spouses_attributes: [:id,
								:first_name, 
								:second_name, 
								:last_name,
								:second_last_name,
								:birth_date,
								:married_date,
								:gender],
			offsprings_attributes: [:id,
								:first_name, 
								:second_name, 
								:last_name,
								:second_last_name,
								:birth_date,
								:gender],
			addresses_attributes: [:id,
								:user_id,
								:client_id,
								:street,
								:exterior_number,
								:interior_number,
								:county,
								:state,
								:city,
								:delegation,
								:zip_code,
								:country]
		).merge(user_id: current_user.id, real_client: true, client_prospect: true)
	end

end
