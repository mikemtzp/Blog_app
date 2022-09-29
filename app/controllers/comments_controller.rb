class CommentsController < ApplicationController
  authorize_resource
  before_action :set_post, only: %i[index new create]

  def index
    @user = User.find(params[:user_id])
    @comments = Comment.where(post_id: @post.id).order('created_at DESC')
  end

  def new
    @user = current_user
    @comment = Comment.new
    respond_to do |format|
      format.html { render :new, locals: { comment: @comment } }
    end
  end

  def create
    @user = current_user
    @comment = Comment.new(comments_params)
    @comment.author = @user
    @comment.post = @post

    respond_to do |format|
      format.html do
        if @comment.save
          flash[:success] = 'Comment saved successfully'
          redirect_to user_posts_path(@post.author)
        else
          flash.now[:error] = 'Error: Comment could not be saved'
          render :new, locals: { comment: @comment }, status: 422
        end
      end
    end
  end

  def destroy
    @comment = Comment.find(params[:id])
    @comment.destroy
    flash[:success] = 'The comment was successfully destroyed.'
    redirect_to user_post_path(@comment.author.id, @comment.post.id)
  end

  private

  def comments_params
    params.require(:comment).permit(:text, :author, :post)
  end

  def set_post
    @post = Post.find(params[:post_id])
  end
end
