class Client < ActiveRecord::Base
	belongs_to :user, inverse_of: :clients

	has_many :spouses, inverse_of: :client
	accepts_nested_attributes_for :spouses, allow_destroy: true

	has_many :prospects, inverse_of: :client
	has_many :policies, inverse_of: :client
	has_many :events, inverse_of: :client
	has_many :offsprings, inverse_of: :client
	has_many :addresses, inverse_of: :client

	enum marital_status: [:single, :married, :widowed]
	enum gender: [:male, :female, :other]


	def full_name
		return first_name + ' ' + second_name + ' ' + last_name + ' ' + second_last_name
	end

end