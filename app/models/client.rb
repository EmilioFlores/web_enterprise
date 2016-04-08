# == Schema Information
#
# Table name: clients
#
#  id               :integer          not null, primary key
#  user_id          :integer
#  marital_status   :integer          default(0)
#  first_name       :string
#  second_name      :string
#  last_name        :string
#  second_last_name :string
#  birth_date       :datetime
#  gender           :integer
#  email            :string
#  phone_number     :string
#  cellphone_number :string
#  has_kids         :boolean          default(FALSE)
#  is_vip           :boolean          default(FALSE)
#  client_since     :datetime
#  deleted_at       :datetime
#  created_at       :datetime         not null
#  updated_at       :datetime         not null
#

class Client < ActiveRecord::Base
	belongs_to :user, inverse_of: :clients

	has_many :spouses, inverse_of: :client
	accepts_nested_attributes_for :spouses, allow_destroy: true

	has_many :prospects, inverse_of: :client
	has_many :policies, inverse_of: :client
	has_many :events, inverse_of: :client
	has_many :offsprings, inverse_of: :client
	has_many :addresses, inverse_of: :client

	enum marital_status: [:single, :married, :widowed]
	enum gender: [:male, :female, :other]

	def full_name
		return first_name + ' ' + second_name + ' ' + last_name + ' ' + second_last_name
	end

end
