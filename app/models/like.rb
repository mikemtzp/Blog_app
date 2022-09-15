class Like < ApplicationRecord
  belongs_to :author, class_name: 'User'
  belongs_to :post

  # A method that updates the likes counter for a post.
  def update_likes_counter
    post = Post.find(post_id)
    post.update(likes_counter: Like.where(post_id:).count)
  end
end
