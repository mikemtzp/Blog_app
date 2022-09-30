class Api::V1::CommentsController < ApplicationController
  skip_before_action :verify_authenticity_token
  before_action :set_post, only: %i[index new]

  def index
    render json: @post.comments
  end

  def new
    @user = current_user
  end

  def create
    @comment = Comment.create(text: params[:text], author: User.find(1), post: Post.find(3))
    render json: @comment
  end

  private

  def set_post
    @post = Post.find(params[:post_id])
  end
end
