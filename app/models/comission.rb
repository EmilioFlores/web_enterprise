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
#  policy_id       :integer
#

class Comission < ActiveRecord::Base
  acts_as_paranoid
  
	belongs_to :policy, inverse_of: :comission

  validates :policy, presence: true
  validates :first_year, presence: true
  validates :second_year, presence: true
  validates :third_year, presence: true
  validates :fourth_year, presence: true
  validates :post_fifth_year, presence: true
  validates :base_prime, presence: true
end
