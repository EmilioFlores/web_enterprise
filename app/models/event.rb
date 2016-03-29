class Event < ActiveRecord::Base
	has_many :notifications, inverse_of: :event
end