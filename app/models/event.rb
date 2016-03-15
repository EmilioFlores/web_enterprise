class Event < ActiveRecord::Base
	has_many :notifications
end