class Post < ApplicationRecord
  belongs_to :author, class_name: 'User', foreign_key: :author_id
  has_many :likes, dependent: :destroy
  has_many :comments, dependent: :destroy

  validates :title, presence: true
  validates :title, length: { maximum: 250, too_long: '%<count> characters is the maximum allowed' }
  validates :comments_counter, :likes_counter, numericality: { only_integer: true, greater_than_or_equal_to: 0 }

  after_save :increment_posts_counter
  after_destroy :decrement_posts_counter

  def recent_comments
    Comment.where(post_id: self).order('created_at DESC').limit(5)
  end

  private

  def increment_posts_counter
    author.increment!(:posts_counter)
  end

  def decrement_posts_counter
    author.decrement!(:posts_counter)
  end
end
