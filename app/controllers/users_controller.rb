class UsersController < ApplicationController
  before_filter :authenticate_user!

  def show
    @user = User.find(params[:id])

  end
  
  def bookmarklet
    respond_to do |format|
      format.js {}
      format.css {}
      format.html {redirect_to root_path} 
    end  
  end

end
