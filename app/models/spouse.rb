class Spouse < ActiveRecord::Base
	belongs_to :client, inverse_of: :spouses
end