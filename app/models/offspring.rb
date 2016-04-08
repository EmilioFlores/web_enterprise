# == Schema Information
#
# Table name: offsprings
#
#  id               :integer          not null, primary key
#  client_id        :integer
#  first_name       :string
#  second_name      :string
#  last_name        :string
#  second_last_name :string
#  birth_date       :datetime
#  gender           :integer
#  deleted_at       :datetime
#  created_at       :datetime         not null
#  updated_at       :datetime         not null
#

class Offspring < ActiveRecord::Base
	belongs_to :client, inverse_of: :offsprings
end
