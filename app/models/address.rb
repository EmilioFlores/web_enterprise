class Address < ActiveRecord::Base
	belongs_to :user, inverse_of: :addresses
	belongs_to :client, inverse_of: :addresses
end