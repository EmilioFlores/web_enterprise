# == Schema Information
#
# Table name: policies
#
#  id              :integer          not null, primary key
#  client_id       :integer
#  policy_type     :integer
#  renewal_method  :integer
#  payment_method  :integer
#  comission_id    :integer
#  policy_number   :string
#  issued_date     :datetime
#  expiration_date :datetime
#  product_name    :string
#  deleted_at      :datetime
#  created_at      :datetime         not null
#  updated_at      :datetime         not null
#  company_id      :integer
#

class Policy < ActiveRecord::Base
	enum policy_type: [:type1, :type2, :type3]
	enum renewal_method: [:renewal_method1, :renewal_method2, :renewal_method3]
	enum payment_method: [:payment_method1, :payment_method2, :payment_method3]

	has_one :comission, inverse_of: :policy
	belongs_to :client, inverse_of: :policies
	belongs_to :company, inverse_of: :policies
end
