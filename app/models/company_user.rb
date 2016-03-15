class CompanyUser < ActiveRecord::Base
	belongs_to :client, inverse_of: :company_users
	belongs_to :user, inverse_of: :company_users
	belongs_to :company, inverse_of: :company_users
end