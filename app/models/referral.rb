# == Schema Information
#
# Table name: referrals
#
#  id          :integer          not null, primary key
#  referrer_id :integer
#  referee_id  :integer
#  deleted_at  :datetime
#  created_at  :datetime         not null
#  updated_at  :datetime         not null
#

class Referral < ActiveRecord::Base
	belongs_to :user, inverse_of: :referrals
end
