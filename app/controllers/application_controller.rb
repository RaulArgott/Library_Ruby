class ApplicationController < ActionController::Base
  protect_from_forgery with: :exception
  helper_method :current_controller , :fav_text 
  def current_controller (name)    
    return  controller_name == name ? "nav-link  active" : "nav-link"
  end
  def fav_text
    return @fav_exists ? 'UnFav' : 'Fav'
  end
end
