class PoliciesController < ApplicationController

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
																	 :expiration_date)
	end
end