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
  
  # PUT /calls/1
  # PUT /calls/1.json
  def update
    current_user.update_attributes(params[:user])
    respond_to do |format|
      if current_user.save
        format.html { redirect_to root_url, notice: 'Save Successful.' }
        format.json { head :ok }
      else
          format.html { redirect_to root_url, notice: 'Save Failed.' }
      end
    end
  end

end
