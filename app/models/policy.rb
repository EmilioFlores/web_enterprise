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
	belongs_to :comission, inverse_of: :policy
	belongs_to :client, inverse_of: :policies
	belongs_to :company, inverse_of: :policies
end
