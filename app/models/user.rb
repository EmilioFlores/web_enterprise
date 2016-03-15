class User < ActiveRecord::Base
	has_many :addresses
	has_many :referrals
	has_many :cleints
	has_many :company_users
	acts_as_paranoid
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable
end
