class Company < ActiveRecord::Base
	belongs_to :policy
	has_one :comission
	has_many :company_users
end