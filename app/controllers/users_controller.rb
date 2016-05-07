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
  before_filter :check_session

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

  def profile
    @user = current_user
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

  def new_company
    @company_user = CompanyUser.new(user_id: current_user.id)
  end

  def edit_company
    @company_user = CompanyUser.find(params[:id])
  end

  def create_company
    @company_user = CompanyUser.new(company_user_params)
    if @company_user.save
      flash[:success] = t('company_added')
      redirect_to user_path
    else
      flash[:error] = t('company_user_error')
      render :new_company
    end
  end

  def update_company
    @company_user = CompanyUser.find(params[:id])
    if @company_user.update_attributes(company_user_params)
      flash[:success] = t('company_updated')
      redirect_to user_path
    else
      flash[:error] = t('company_user_update_error')
      render :new_company
    end
  end

  private

  def redirect_after_complete_registration
    if @user.completed?
      redirect_to root_path
    else
      redirect_to complete_registration_path
    end
  end

  def complete_registration_params
    params.require(:user).permit(:first_name, :second_name, :last_name,
                                 :second_last_name, :phone_number,
                                 company_users_attributes: [:id, :company_id,
                                                            :_destroy,
                                                            :number_company,
                                                            :has_promotoria,
                                                            :user_name,
                                                            :has_company,
                                                            :agent_number,
                                                            :has_promotoria,
                                                            :number_promotoria,
                                                            :name_promotoria_contact,
                                                            :phone_promotoria_contact,
                                                            :email_promotoria_contact,
                                                            :has_company,
                                                            :number_company,
                                                            :name_company_contact,
                                                            :phone_company_contact,
                                                            :email_company_contact
                                                            ])
  end

  def company_user_params
    params.require(:company_user).permit(:company_id, :number_company,
                                         :has_promotoria, :user_name, 
                                         :has_company, :agent_number, 
                                         :has_promotoria, :number_promotoria, 
                                         :name_promotoria_contact, 
                                         :phone_promotoria_contact, 
                                         :email_promotoria_contact, 
                                         :has_company, :number_company,
                                         :name_company_contact, 
                                         :phone_company_contact,
                                         :email_company_contact).merge(user_id: current_user.id)
  end
end