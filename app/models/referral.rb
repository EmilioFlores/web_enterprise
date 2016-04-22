# == Schema Information
#
# Table name: referrals
#
#  id          		:integer  	not null, primary key
#  referrer_id 		:integer
#  referee_id  		:integer
#  first_name 		:string
#  second_name 		:string
#  last_name 		:string
#  second_last_name :string
#  email 			:string
#  deleted_at  		:datetime
#  created_at  		:datetime   not null
#  updated_at  		:datetime   not null
#

class Referral < ActiveRecord::Base
	belongs_to :referrer, class_name: 'User', inverse_of: :referrals
	
	def full_name
		return "#{first_name}  #{second_name}  #{last_name}  #{second_last_name}"
	end
end
