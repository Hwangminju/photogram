class PostsController < ApplicationController
  before_action :authenticate, except: [:index]
  def index
  end
end