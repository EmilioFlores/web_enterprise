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

class Referral < ActiveRecord::Base
  acts_as_paranoid
  enum status: [:pending, :confirmed]

	belongs_to :referrer, class_name: 'User', inverse_of: :referrals

	VALID_EMAIL_REGEX = /\A[\w+\-.]+@[a-z\d\-]+(?:\.[a-z\d\-]+)*\.[a-z]+\z/i

	validates_uniqueness_of :email
	validate :unique_email, on: :create
	validates :email, presence: true, format: { with: VALID_EMAIL_REGEX }

	def full_name
		return "#{first_name}  #{second_name}  #{last_name}  #{second_last_name}"
	end

	private

	def unique_email
    	errors.add(:email, 'This agent is already in the system') unless User.where(email: self.email).blank?
	end

end
