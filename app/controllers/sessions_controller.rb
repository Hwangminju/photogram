class SessionsController < ApplicationController
  def new
  end
  
  def create 
    user = User.find_by(email: params[:email], name: params[:name]) 
    if user && user.authenticate_user(params[:password])
      log_in user
      redirect_to user
    else 
      flash.now[:danger] = 'Invalid email/password/name combination' 
      redirect_to 'new'
    end
  end
  
  def destroy 
    log_out 
    redirect_to '/' 
  end

end
