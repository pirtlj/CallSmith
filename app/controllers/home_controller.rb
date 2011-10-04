class HomeController < ApplicationController
  
  def index
    @users = User.all
    
    render :layout => 'application'
  end
end
