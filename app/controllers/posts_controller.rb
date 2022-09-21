class PostsController < ApplicationController
  def index
    @posts = Post.all
    @user = User.find(params[:user_id])
    @comments = Comment.find(params[:user_id])
  end

  def show
    puts params
  end
end
