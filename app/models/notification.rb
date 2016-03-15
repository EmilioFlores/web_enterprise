class Notification < ActiveRecord::Base
	belongs_to :event, inverse_of: :notifications
end