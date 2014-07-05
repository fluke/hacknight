class ApplicationController < ActionController::Base
  # Prevent CSRF attacks by raising an exception.
  # For APIs, you may want to use :null_session instead.
  protect_from_forgery with: :exception
  require 'net/http'

  def after_sign_in_path_for(resource)
    dashboard_path
  end
  
  def proj
  	"VitaminCV"
  end

  helper_method :proj
end
