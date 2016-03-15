class Client < ActiveRecord::Base
	belongs_to :user
	has_many :spouses
	has_many :prospects
	has_many :policies
	has_many :events
	has_many :offsprings
	has_one :addresses

	enum marital_status: [:single, :married, :widowed]
end