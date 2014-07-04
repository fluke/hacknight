class ResumesController < ApplicationController
	include Wicked::Wizard
	steps :basic_information, :work_experience, :education_information, :skills_and_qualifications, :extra_fields, :references, :theme, :url
	before_action :authenticate_user!
  def show
  	@resume = Resume.find_by_id(params[:id])
  end


  def new
  	@resume = Resume.new(:user => current_user)
  end
end
