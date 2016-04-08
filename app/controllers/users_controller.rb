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

class UsersController < ApplicationController
  def set_locale
    new_locale = params[:locale]
    if ['es', 'en'].include?(new_locale)
      current_user.update_attributes(locale: new_locale)
      I18n.locale = new_locale.to_sym
      flash[:success] = t('locale_changed')
      redirect_to root_path
    else
      flash[:error] = t('locale_changed_error')
      redirect_to root_path
    end
  end

  def complete_registration
    @user = current_user
  end

  def complete_registration_update
    @user = User.find(params[:id])
    if @user.update(complete_registration_params)
      flash[:success] = I18n.t('user_updated')
      redirect_after_complete_registration
    else
      flash[:error] = I18n.t('user_updated_error')
      render :complete_registration
    end
  end

  def user_companies
    @user = current_user
  end

  private

  def redirect_after_complete_registration
    if @user.completed?
      redirect_to user_companies_path(@user)
    else
      redirect_to complete_registration_path
    end
  end

  def complete_registration_params
    params.require(:user).permit(:first_name, :second_name, :last_name,
                                 :second_last_name, :phone_number)
  end
end
