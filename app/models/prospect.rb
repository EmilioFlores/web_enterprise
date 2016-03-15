class Prospect < ActiveRecord::Base
	belongs_to :client, inverse_of: :prospects
end