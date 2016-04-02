class User < ActiveRecord::Base
	acts_as_paranoid
	enum marital_status: [:single, :married, :widowed]
	enum status: [:registered, :completed]
	# Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable

	has_many :addresses, inverse_of: :user
	has_many :clients, inverse_of: :user
	has_many :referrals, inverse_of: :user
	has_many :company_users, inverse_of: :user
end
