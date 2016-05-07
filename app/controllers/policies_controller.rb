# == Schema Information
#
# Table name: policies
#
#  id              :integer          not null, primary key
#  client_id       :integer
#  policy_type     :integer
#  renewal_method  :integer
#  payment_method  :integer
#  policy_number   :string
#  issued_date     :datetime
#  expiration_date :datetime
#  product_name    :string
#  deleted_at      :datetime
#  created_at      :datetime         not null
#  updated_at      :datetime         not null
#  company_id      :integer
#

class PoliciesController < ApplicationController
	before_filter :check_session_and_completed_user

	def index
		@policies = Policy.all()
	end

	def show
		@policy = Policy.find(params[:id])
	end

	def new
		@policy = Policy.new
	end

	def edit
		@policy = Policy.find(params[:id])
	end

	def create
		@policy = Policy.new(policy_params)
		if @policy.save
			redirect_to policy_path(@policy)
		else 
			render :new
		end
	end

	def update
		@policy = Policy.find(params[:id])
		if @policy.update_attributes(policy_params)
			redirect_to @policy, notice: 'Policy was successfully updated.'
		else
			render action: "edit"
		end
	end

	private

	def policy_params
		params.require(:policy).permit(:client_id, :comission_id, :company_id,
									   :product_name, :policy_type, :renewal_method,
									   :payment_method, :issued_date,
									   :expiration_date, :policy_number,
									   comission_attributes: [
									   		:id,
									   		:first_year,
											:second_year,
											:third_year,
											:fourth_year,
											:fifth_year,
											:post_fifth_year,
											:base_prime, :_destroy])
	end
end
