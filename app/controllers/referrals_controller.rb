# == Schema Information
#
# Table name: referrals
#
#  id               :integer          not null, primary key
#  referrer_id      :integer
#  referee_id       :integer
#  deleted_at       :datetime
#  created_at       :datetime         not null
#  updated_at       :datetime         not null
#  first_name       :string
#  second_name      :string
#  last_name        :string
#  second_last_name :string
#  email            :string
#

class ReferralsController < ApplicationController
	before_action :find_model, only: [:show, :edit, :update]


	def index
		@referrals = current_user.referrals
	end

	def show
	end

	def new
		@referral = Referral.new
	end

	def edit
	end

	def create
		@referral = Referral.new(referral_params)
		if @referral.save
			redirect_to referral_path(@referral)
		else 
			render :new
		end
	end

	def update
		if @referral.update_attributes(referral_params)
			redirect_to @referral, notice: 'Referral was successfully updated.'
		else
			render action: "edit"
		end
	end

	private
	def find_model
		@referral = Referral.find(params[:id]) if params[:id]
	end

	def referral_params
		params.require(:referral).permit(
				:first_name,
				:second_name,
				:last_name,
				:second_last_name,
				:email
			).merge(referrer_id: current_user.id)
	end

end
