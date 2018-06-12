class UsersController < ApplicationController
  
  def index
    @users = User.all
  end
  
  def show
  end
  
  def new
  end
  
  def create 
    User.create(email: params[:email], 
    password: params[:password], 
    password_confirmation: params[:password_confirmation], 
    name: params[:name])
    redirect_to '/' 
  end
  
end
