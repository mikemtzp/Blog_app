class Comment < ApplicationRecord
  belongs_to :author, class_name: 'User'
  belongs_to :post

  # A method that updates the comments counter for a post.
  def update_comments_counter
    post = Post.find(post_id)
    post.update(comments_counter: Comment.where(post_id:).count)
  end
end
