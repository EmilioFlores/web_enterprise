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
  enum marital_status: [:single, :married, :widowed]
  enum status: [:registered, :completed, :enable, :disable]
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable

  before_save :update_status

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

  def update_status
    return if enable?
    self.status = 'completed' if registration_attributes?
    return unless completed?
    self.status = 'enable' if company_users.count > 0
  end
end
