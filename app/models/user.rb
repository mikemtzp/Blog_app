class User < ApplicationRecord
  has_many :posts, inverse_of: :author
  has_many :likes, inverse_of: :author
  has_many :comments, inverse_of: :author

  validates :name, presence: true
  validates :posts_counter, numericality: { only_integer: true, greater_than_or_equal_to: 0 }

  # A method that returns the 3 most recent posts for a given user.
  def recent_posts
    Post.where(author_id: self).order('created_at ASC').limit(3)
  end
end
