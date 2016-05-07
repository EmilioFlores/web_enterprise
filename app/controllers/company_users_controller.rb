class CompanyUsersController < ApplicationController
  before_filter :check_session_and_completed_user

  def show
    @company_user = CompanyUser.find(params[:id])
  end
end