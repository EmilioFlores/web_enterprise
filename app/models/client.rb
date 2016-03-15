class Client < ActiveRecord::Base
	belongs_to :user, inverse_of: :clients
	has_many :spouses, inverse_of: :client
	has_many :prospects, inverse_of: :client
	has_many :policies, inverse_of: :client
	has_many :events, inverse_of: :client
	has_many :offsprings, inverse_of: :client
	has_many :addresses, inverse_of: :client

	enum marital_status: [:single, :married, :widowed]
end