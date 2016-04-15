# == Schema Information
#
# Table name: comissions
#
#  id              :integer          not null, primary key
#  first_year      :float
#  second_year     :float
#  third_year      :float
#  fourth_year     :float
#  fifth_year      :float
#  post_fifth_year :float
#  base_prime      :float
#  deleted_at      :datetime
#  created_at      :datetime         not null
#  updated_at      :datetime         not null
#

class Comission < ActiveRecord::Base
	belongs_to :policy, inverse_of: :comission
end
