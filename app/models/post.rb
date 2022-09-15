class Post < ApplicationRecord
  belongs_to :author, class_name: 'User'
  has_many :likes
  has_many :comments

  after_save :update_post_counter

  # A method that returns the 5 most recent comments for a given post.
  def recent_comments
    Comment.where(post_id: self).order('created_at DESC').limit(5)
  end

  private

  # A method that updates the posts counter for a user
  def update_post_counter
    author.increment!(:post_counter)
  end
end
