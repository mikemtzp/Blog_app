class Post < ApplicationRecord
  belongs_to :author, class_name: 'User'
  has_many :likes
  has_many :comments

  # A method that updates the posts counter for a user.
  def update_post_counter
    user = User.find(author_id)
    user.update(posts_counter: Post.where(author_id:).count)
  end

  # A method which returns the 5 most recent comments for a given post.
  def recent_comments
    Comment.where(post_id: self).order('created_at DESC').limit(5)
  end
end
