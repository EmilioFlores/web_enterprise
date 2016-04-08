# == Schema Information
#
# Table name: addresses
#
#  id              :integer          not null, primary key
#  user_id         :integer
#  street          :string
#  exterior_number :string
#  interior_number :string
#  county          :string
#  state           :string
#  city            :string
#  delegation      :string
#  zip_code        :string
#  country         :string
#  deleted_at      :datetime
#  created_at      :datetime         not null
#  updated_at      :datetime         not null
#  client_id       :integer
#

class Address < ActiveRecord::Base
	belongs_to :user, inverse_of: :addresses
	belongs_to :client, inverse_of: :addresses
end
