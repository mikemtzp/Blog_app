class CommentsController < ApplicationController
  load_and_authorize_resource

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
          render :new, locals: { comment: @comment }, status: 422
        end
      end
    end
  end

  def destroy
    @post = Post.find(params[:id])
    # @post = Comment.find(params[:id])
    # @comment = Comment.find_by(id: :id)
    @comment.destroy
    flash[:success] = 'The comment was successfully destroyed.'
  end

  private

  def comments_params
    params.require(:comment).permit(:text, :id)
  end
end
