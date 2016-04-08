class Spouse < ActiveRecord::Base
	belongs_to :client, inverse_of: :spouses
	enum gender: [:male, :female, :other]

	def full_name
		return first_name + ' ' + second_name + ' ' + last_name + ' ' + second_last_name
	end
end