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

class ProspectsController < ApplicationController
	before_filter :check_session_and_completed_user

	def index
		@prospects = current_user.clients.any_prospects
	end

	def show
		@prospect = Client.find(params[:id])
		redirect_to client_path(@prospect) if @prospect.real_client?
	end

	def new
		@prospect = Client.new
	end

	def create
		@prospect = Client.new(prospect_params)
		if @prospect.save
			redirect_to prospect_path(@prospect)
		else 
			render :new_prospect
		end
	end

	def edit
		@prospect = Client.find(params[:id])
	end

	def update
		@prospect = Client.find(params[:id])
		if @prospect.update_attributes(prospect_params)
			redirect_to @prospect, notice: 'Client was successfully updated.'
		else
			render action: "edit"
		end
	end

	def destroy
		@prospect = Prospect.find(params[:id])
	    @prospect.destroy
		redirect_to prospects_path
	end

	private

	def prospect_params
		params.require(:client).permit(:first_name, :second_name, :last_name,
																	 :second_last_name, :birth_date, :gender,
																	 :email, :phone_number, :cellphone_number,
		 			  											 :has_kids, :is_vip, :client_since,
		 			  											 :real_client, :client_prospect,
																	 spouses_attributes: [:id, :first_name, 
																	 											:second_name,
																	 											:last_name, 
																	 											:second_last_name, 
																	 											:birth_date, 
																	 											:married_date, :gender, :_destroy],
																	 offsprings_attributes: [:id, :first_name,  
																	 												 :second_name,  
																	 												 :last_name, 
																	 												 :second_last_name, 
																	 												 :birth_date, 
																	 												 :gender, :_destroy],
																	 addresses_attributes: [:id, :user_id, 
																													:client_id, :street,
																													:exterior_number,
																													:interior_number,
																													:county, :state, 
																													:city, :delegation,
																													:zip_code, :country, :_destroy]
																	).merge(user_id: current_user.id)
	end

end
