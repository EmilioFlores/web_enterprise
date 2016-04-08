# == Schema Information
#
# Table name: users
#
#  id                         :integer          not null, primary key
#  email                      :string           default(""), not null
#  encrypted_password         :string           default(""), not null
#  reset_password_token       :string
#  reset_password_sent_at     :datetime
#  remember_created_at        :datetime
#  sign_in_count              :integer          default(0), not null
#  current_sign_in_at         :datetime
#  last_sign_in_at            :datetime
#  current_sign_in_ip         :inet
#  last_sign_in_ip            :inet
#  created_at                 :datetime         not null
#  updated_at                 :datetime         not null
#  locale                     :string           default("en")
#  first_name                 :string
#  second_name                :string
#  last_name                  :string
#  second_last_name           :string
#  phone_number               :string
#  user_type                  :integer          default(0)
#  deleted_at                 :datetime
#  resp_civil_policy_company  :string
#  resp_civil_policy_number   :string
#  resp_civil_policy_end_date :datetime
#  secondary_email            :string
#  legal_entity               :string
#  business_name              :string
#  user_rfc                   :string
#  email_invoice              :string
#  status                     :integer          default(0)
#

require 'rails_helper'

RSpec.describe User, type: :model do
  pending "add some examples to (or delete) #{__FILE__}"
end
