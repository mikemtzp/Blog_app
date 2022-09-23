class LikesController < ApplicationController
  def create
    @user = current_user
    @post = Post.find(params[:post_id])
    @like = Like.new(like_params)
    @like.author = @user
    @like.post = @post

    respond_to do |format|
      format.html do
        if @like.save
          flash[:success] = 'Like saved successfully'
          redirect_to user_post_path(@user, @post)
        else
          flash.now[:error] = 'Error: Like could not be saved'
          render :new, locals: { like: @like }, status: 422
        end
      end
    end
  end

  private

  def like_params
    params.permit(:author, :post)
  end
end
