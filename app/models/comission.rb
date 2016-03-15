class Comission < ActiveRecord::Base
	has_one :policy, inverse_of: :comissions
end