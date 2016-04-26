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
		@data = Client.all.map { |c| c.birth_date.to_s }
		
	end

	def show
	end


end
