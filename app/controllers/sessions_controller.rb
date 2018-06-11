class SessionsController < ApplicationController
  def new
  end
  
  def create 
    user = User.find_by(email: params[:email]) 
    if user && user.authenticate(params[:password])
      session[:user_id] = user.id 
      redirect_to user
    else 
      flash[:alert] = 'Invalid email/password combination' 
      redirect_to 'new'
    end
  end
  
  def destroy 
    log_out redirect_to '/' 
  end

end
