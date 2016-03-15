class Client < ActiveRecord::Base
	belongs_to : user
	has_many : spauses
	has_many : prospects
	has_many : policies
	has_many : events
	has_many : offsprings
	has_one : addresses
end