class ResumeStepsController < ApplicationController
	include Wicked::Wizard
  	steps :email, :basic_info, :work, :education, :skills, :references

  	def show
  		render_wizard
  	end
end
