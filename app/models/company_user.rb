# == Schema Information
#
# Table name: company_users
#
#  id                       :integer          not null, primary key
#  user_id                  :integer
#  company_id               :integer
#  agent_number             :string
#  user_name                :string
#  password_hash            :string
#  password_salt            :string
#  protal_url               :string
#  has_promotoria           :boolean          default(FALSE)
#  number_promotoria        :string
#  name_promotoria_contact  :string
#  phone_promotoria_contact :string
#  email_promotoria_contact :string
#  has_company              :boolean          default(FALSE)
#  number_company           :string
#  name_company_contact     :string
#  phone_company_contact    :string
#  email_company_contact    :string
#  deleted_at               :datetime
#  created_at               :datetime         not null
#  updated_at               :datetime         not null
#

class CompanyUser < ActiveRecord::Base
  acts_as_paranoid

	belongs_to :user, inverse_of: :company_users
	belongs_to :company, inverse_of: :company_users

  validates :user, presence: true
  validates :company, presence: true

  validates :agent_number, presence: true
end
