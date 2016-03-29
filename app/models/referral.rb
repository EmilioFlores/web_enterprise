class Referral < ActiveRecord::Base
	belongs_to :user, inverse_of: :referrals
end