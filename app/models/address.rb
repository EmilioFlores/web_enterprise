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
  acts_as_paranoid
  
	belongs_to :user, inverse_of: :addresses
	belongs_to :client, inverse_of: :addresses

  validates :county, presence: true
  validates :state, presence: true
  validates :city, presence: true
  validates :delegation, presence: true
  validates :zip_code, presence: true
  validates :country, presence: true
end