class PostsController < ApplicationController
  before_action :authenticate_user!, except: [:index]
  
  def index
    @posts = Post.all.order('created_at desc')
    if user_signed_in?
      @posts_count = current_user.posts.length
    end
  end
  
  def create 
    new_post = Post.new(user_id: current_user.id, content: params[:content]) 
    
    if new_post.save 
      redirect_to root_path 
    else 
      redirect_to new_post_path 
    end 
  end
  
end
