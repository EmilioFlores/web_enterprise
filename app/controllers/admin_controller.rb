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

  def update_user
    @user = User.find(params[:id])
    if params[:enabled] == 'true'
      @user.update_columns(status: 1)
    else
      @user.update_columns(status: 0)
    end
    render json: @user, status: 200
  end
end
