class User < ApplicationRecord
  has_many :posts, inverse_of: 'author'
  has_many :likes, inverse_of: 'author'
  has_many :comments, inverse_of: 'author'

  # A method that returns the 3 most recent posts for a given user.
  def recent_posts
    Post.where(author_id: self).order('created_at DESC').limit(3)
  end
end
