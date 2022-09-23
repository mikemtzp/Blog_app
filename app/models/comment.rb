class Comment < ApplicationRecord
  belongs_to :author, class_name: 'User', foreign_key: :author_id
  belongs_to :post

  validates :text, presence: true

  after_save :update_comments_counter

  private

  # A method that updates the comments counter for a post.
  def update_comments_counter
    post.increment!(:comments_counter)
  end
end
