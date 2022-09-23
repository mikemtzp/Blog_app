class CommentsController < ApplicationController
  def new
    @user = current_user
    @post = Post.find(params[:post_id])
    @comment = Comment.new
    respond_to do |format|
      format.html { render :new, locals: { comment: @comment } }
    end
  end

  def create
    @user = current_user
    @post = Post.find(params[:post_id])
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
        end
      end
    end
  end

  private

  def comments_params
    params.require(:comment).permit(:text, :author, :post)
  end
end
