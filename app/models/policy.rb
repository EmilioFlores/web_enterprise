class Policy < ActiveRecord::Base
	belongs_to :comission, inverse_of: :policy
	belongs_to :client, inverse_of: :policies
	belongs_to :company, inverse_of: :policies
end