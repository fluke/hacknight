class ResumesController < ApplicationController
	
  def show
  	@resume = Resume.find_by_id(params[:id])
  end


  def new
  	@resume = Resume.new(:user => current_user)
  end
end
