class PostsController < ApplicationController
  def index
    @user = User.find(params[:user_id])
    @posts = Post.where(author_id: @user.id).order('created_at DESC')
    @comments = Comment.find(params[:user_id])
  end

  def show
    @user = User.find(params[:user_id])
    @post = Post.find(params[:id])
    @comments = Comment.all.find(params[:user_id])
  end

  def new
    @post = Post.new
    
  end
end
