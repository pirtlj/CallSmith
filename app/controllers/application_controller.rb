class ApplicationController < ActionController::Base

  protect_from_forgery
  
  after_filter :set_access_control_headers
  
   
  def set_access_control_headers
     headers['Access-Control-Allow-Origin'] = '*'
     headers['Access-Control-Request-Method'] = '*'
  end
  
  
  def after_sign_in_path_for(resource)
      stored_location_for(resource) || instructions_path
  end
end
