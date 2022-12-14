class PostsController < ApplicationController
  load_and_authorize_resource

  def index
    @user = User.find(params[:user_id])
    @posts = Post.where(author_id: @user.id).order('created_at DESC')
    @comments = Comment.where(id: params[:user_id])
    respond_to do |format|
      format.html { render :index }
    end
  end

  def show
    @user = User.find(params[:user_id])
    @post = Post.find(params[:id])
    @comments = Comment.includes(:post).where(id: params[:user_id])
  end

  def new
    @user = current_user
    @post = Post.new
    respond_to do |format|
      format.html { render :new, locals: { post: @post } }
    end
  end

  def create
    @user = current_user
    @post = @user.posts.new(post_params)

    respond_to do |format|
      format.html do
        if @post.save
          flash[:success] = 'Post saved successfully'
          redirect_to user_path(@user.id)
        else
          flash.now[:error] = 'Error: Post could not be saved'
          render :new, locals: { post: @post }, status: 422
        end
      end
    end
  end

  def destroy
    @post = Post.find(params[:id])
    @post.destroy
    flash[:success] = 'The post was successfully destroyed.'
    redirect_to user_posts_path
  end

  private

  def post_params
    params.require(:post).permit(:title, :text)
  end
end
