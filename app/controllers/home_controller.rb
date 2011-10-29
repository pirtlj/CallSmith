class HomeController < ApplicationController
  before_filter :authenticate_user!, :except => [:index]
  
  def index
    @users = User.all
    
    render :layout => 'application'
  end
  
  def home
  end
  
  def instructions
  end
end
