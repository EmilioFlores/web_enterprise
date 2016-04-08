# == Schema Information
#
# Table name: prospects
#
#  id             :integer          not null, primary key
#  client_id      :integer
#  company_id     :integer
#  product_type   :string
#  payment_method :integer
#  end_date       :datetime
#  created_at     :datetime         not null
#  updated_at     :datetime         not null
#

class Prospect < ActiveRecord::Base
	belongs_to :client, inverse_of: :prospects
end
