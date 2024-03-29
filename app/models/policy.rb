# == Schema Information
#
# Table name: policies
#
#  id              :integer          not null, primary key
#  client_id       :integer
#  policy_type     :integer
#  renewal_method  :integer
#  payment_method  :integer
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
  acts_as_paranoid

	enum policy_type: [:type1, :type2, :type3]
	enum renewal_method: [:renewal_method1, :renewal_method2, :renewal_method3]
	enum payment_method: [:payment_method1, :payment_method2, :payment_method3]

	has_one :comission, inverse_of: :policy, dependent: :destroy
	accepts_nested_attributes_for :comission, allow_destroy: true

	belongs_to :client, inverse_of: :policies
	belongs_to :company, inverse_of: :policies

  validates :client, presence: true
  validates :company, presence: true
  validates :comission, presence: true



  # Full calendar data
	def title
		
		name = self.client.full_name if self.client
				
		if I18n.locale == :en 
			"Policy end from: #{name}"
		elsif I18n.locale == :es 
			"Expira poliza de: #{name}"
		end
	end

	def date
		expiration_date.strftime("%Y-%m-%d") if expiration_date
	end

	def link
		"/policies/#{id}"
	end

	def color
		"#4e8ad9"
	end

	def as_json(options={})
	  super(only: [], methods: [:title, :date, :link, :color])
		
end



end
