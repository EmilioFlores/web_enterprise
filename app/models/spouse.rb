# == Schema Information
#
# Table name: spouses
#
#  id               :integer          not null, primary key
#  client_id        :integer
#  first_name       :string
#  second_name      :string
#  last_name        :string
#  second_last_name :string
#  birth_date       :datetime
#  married_date     :datetime
#  gender           :integer
#  deleted_at       :datetime
#  created_at       :datetime         not null
#  updated_at       :datetime         not null
#

class Spouse < ActiveRecord::Base
  acts_as_paranoid

	belongs_to :client, inverse_of: :spouses
	enum gender: [:male, :female, :other]

  validates :first_name, presence: true
  validates :last_name, presence: true
  validates :birth_date, presence: true


	def full_name
		return first_name + ' ' + second_name + ' ' + last_name + ' ' + second_last_name
	end

	# Full calendar data
	def title
		
		name = self.client.full_name if self.client 

		if I18n.locale == :en 
			"Birthdate of spouse #{first_name} #{last_name} \n From #{name}"
		elsif I18n.locale == :es 
			"Cumpleaños de pareja #{first_name} #{last_name} \n de #{name}"
		end

	end

	def date
		birth_date.strftime("%Y-%m-%d") if birth_date
	end

	def link
		"/clients/#{client.id}"
	end

	def color
		"#7566d9"
	end

	def as_json(options={})
	  super(only: [], methods: [:title, :date, :link, :color])
	end

end
