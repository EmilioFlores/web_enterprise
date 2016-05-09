class AdminController < ApplicationController
  before_filter :check_admin

  layout 'admin'

  def index
    @prospects = current_user.clients.any_prospects
  end

  def users_manage
    @users = User.regular
  end

  def referrals_manage
    @referrals = Referral.pending
  end

  def destroy_referral
    @referral = Referral.find(params[:id])
    if @referral.destroy
      flash[:success] = t('referral_destroy')
    else
      flash[:error] = t('referral_destroy_error')
    end
    redirect_to admin_referrals_manage_path
  end

  def update_user
    @user = User.find(params[:id])
    if params[:enabled] == 'true'
      @user.update_columns(status: 1)
    else
      @user.update_columns(status: 0)
    end
    render json: @user, status: 200
  end

  def companies_manage
    @companies = Company.all
  end

  def destroy_company
    @company = Company.find(params[:id])
    if @company.users.any?
      flash[:error] = t('company_destroy_error')
    else
      if @company.destroy
        flash[:success] = t('company_destroy')
      else
        flash[:error] = t('company_destroy_error')
      end
    end
    redirect_to admin_referrals_manage_path
  end

  def new_company
    @company = Company.new
  end

  def create_company
    @company = Company.new(company_params)
    if @company.save
      redirect_to admin_companies_manage_path
    else
      render :new_company
    end
  end

  private

  def company_params
    params.require(:company).permit(:name, :url)
  end
end
