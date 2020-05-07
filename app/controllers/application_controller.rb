class ApplicationController < ActionController::Base
  before_action :authenticate_user!
  protect_from_forgery with: :exception
  helper_method :current_controller  
  def current_controller (name)    
    return  controller_name == name ? "nav-link  active" : "nav-link"
  end
end
