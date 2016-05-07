# == Schema Information
#
# Table name: companies
#
#  id         :integer          not null, primary key
#  name       :string
#  deleted_at :datetime
#  created_at :datetime         not null
#  updated_at :datetime         not null
#

class Company < ActiveRecord::Base
  acts_as_paranoid
  
	has_many :policies, inverse_of: :company
	has_many :company_users, inverse_of: :company

  validates :name, presence: true
  validates :url, presence: true
  validates_format_of :url, with: URI.regexp
end
