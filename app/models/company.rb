# == Schema Information
#
# Table name: companies
#
#  id         :integer          not null, primary key
#  name       :string
#  deleted_at :datetime
#  created_at :datetime         not null
#  updated_at :datetime         not null
# t.float    "first_year"
# t.float    "second_year"
# t.float    "third_year"
# t.float    "fourth_year"
# t.float    "fifth_year"
# t.float    "post_fifth_year"
# t.float    "base_prime"
# t.datetime "deleted_at"
# t.datetime "created_at"
# t.datetime "updated_at"
# t.integer  "policy_id"
#

class Company < ActiveRecord::Base
  acts_as_paranoid

	has_many :policies, inverse_of: :company
	has_many :company_users, inverse_of: :company
  has_many :users, inverse_of: :companies, through: :company_users

  validates :name, presence: true
  validates :url, presence: true
  validates_format_of :url, with: URI.regexp
end
