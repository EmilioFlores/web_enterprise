class AdminController < ApplicationController
  before_filter :check_admin

  layout 'admin'

  def index
    @prospects = current_user.clients.any_prospects
  end
end
