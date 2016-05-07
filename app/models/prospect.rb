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
  acts_as_paranoid

	belongs_to :client, inverse_of: :prospects

  validates :client, presence: true
  validates :product_type, presence: true

end
