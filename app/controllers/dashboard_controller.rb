class DashboardController < ApplicationController
  before_action :authenticate_user!
  def index
    if current_user.resume
      @resume = current_user.resume
    else
      @resume = nil
    end
  end
end
