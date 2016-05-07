class CompanyUsersController < ApplicationController
  before_filter :check_session

  def show
    @company_user = CompanyUser.find(params[:id])
  end
end