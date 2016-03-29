class Company < ActiveRecord::Base
	has_one :policy, inverse_of: :companies
	has_many :company_users, inverse_of: :company
end