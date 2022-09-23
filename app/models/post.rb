class Post < ApplicationRecord
  belongs_to :author, class_name: 'User', foreign_key: :author_id
  has_many :likes, dependent: :destroy
  has_many :comments, dependent: :destroy

  validates :title, presence: true
  validates :title, length: { maximum: 250, too_long: '%<count> characters is the maximum allowed' }
  validates :comments_counter, :likes_counter, numericality: { only_integer: true, greater_than_or_equal_to: 0 }

  after_save :update_post_counter

  # A method that returns the 5 most recent comments for a given post.
  def recent_comments
    Comment.where(post_id: self).order('created_at DESC').limit(5)
  end

  private

  # A method that updates the posts counter for a user
  def update_post_counter
    author.increment!(:posts_counter)
  end
end
