require 'rails_helper'

RSpec.describe Comment, type: :model do
  subject(:comment) do
    Comment.create(text: 'I am your father', post:)
  end

  subject(:post) do
    Post.create(title: 'The Empire Strikes Back', comments_counter: 0, likes_counter: 0)
  end

  describe 'validation' do
    it 'text should be present' do
      comment.text = nil
      expect(comment).not_to be_valid
    end
  end

  describe 'method' do
    it 'update_comments_counter should update the comments counter for a post' do
      expect(post.comments_counter).to eq(0)
      comment.send(:update_comments_counter)
      expect(post.comments_counter).to eq(1)
      comment.send(:update_comments_counter)
      expect(post.comments_counter).to eq(2)
    end
  end
end
