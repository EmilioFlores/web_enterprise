# == Schema Information
#
# Table name: users
#
#  id                         :integer          not null, primary key
#  email                      :string           default(""), not null
#  encrypted_password         :string           default(""), not null
#  reset_password_token       :string
#  reset_password_sent_at     :datetime
#  remember_created_at        :datetime
#  sign_in_count              :integer          default(0), not null
#  current_sign_in_at         :datetime
#  last_sign_in_at            :datetime
#  current_sign_in_ip         :inet
#  last_sign_in_ip            :inet
#  created_at                 :datetime         not null
#  updated_at                 :datetime         not null
#  locale                     :string           default("en")
#  first_name                 :string
#  second_name                :string
#  last_name                  :string
#  second_last_name           :string
#  phone_number               :string
#  user_type                  :integer          default(0)
#  deleted_at                 :datetime
#  resp_civil_policy_company  :string
#  resp_civil_policy_number   :string
#  resp_civil_policy_end_date :datetime
#  secondary_email            :string
#  legal_entity               :string
#  business_name              :string
#  user_rfc                   :string
#  email_invoice              :string
#  status                     :integer          default(0)
#

class User < ActiveRecord::Base
  acts_as_paranoid
  after_save :check_referrals, on: :create
  enum marital_status: [:single, :married, :widowed]
  enum status: [:disabled, :enabled]
  enum user_type: [:regular, :admin]
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable

  has_many :addresses, inverse_of: :user
  has_many :clients, inverse_of: :user
  has_many :referrals, foreign_key: "referrer_id", class_name: 'Referral'
  has_many :company_users, inverse_of: :user

  validates :phone_number, numericality: true, on: :update
  validates :phone_number, presence: true, on: :update

  accepts_nested_attributes_for :company_users, allow_destroy: true

  def full_name
    return "#{first_name}  #{second_name}  #{last_name}  #{second_last_name}"
  end

  private

  def registration_attributes?
    first_name && last_name && phone_number
  end

  def check_referrals
    # user was already saved in 'super' method
    ref = Referral.where(email: email)
    unless ref.empty?
      ref = ref.take # grabbing the first (only) element
      ref.confirmed! if ref.pending?
    end
  end

end
