class User < ActiveRecord::Base
	has_many :addresses, inverse_of: :user
	has_many :clients, inverse_of: :user
	has_many :referrals, inverse_of: :user
	has_many :company_users, inverse_of: :user
	acts_as_paranoid
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable
end
