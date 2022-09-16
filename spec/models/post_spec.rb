require 'rails_helper'

RSpec.describe Post, type: :model do
  subject(:user) do
    User.create(name: 'Kenobi', posts_counter: 0)
  end

  subject(:post) do
    Post.create(title: 'The Revenge of the Sith', comments_counter: 0, likes_counter: 0, author: user)
  end

  describe 'validation' do
    it 'title should be present' do
      post.title = nil
      expect(post).not_to be_valid
    end

    it 'title should not be too long' do
      post.title = 'm' * 251
      expect(post).not_to be_valid
    end

    it 'comments counter should be an integer' do
      post.comments_counter = nil
      expect(post).not_to be_valid
    end

    it 'comments counter should be an integer greater or equal to zero' do
      post.comments_counter = -1
      expect(post).not_to be_valid
    end

    it 'likes counter should be an integer' do
      post.likes_counter = nil
      expect(post).not_to be_valid
    end

    it 'likes counter should be an integer greater or equal to zero' do
      post.likes_counter = -1
      expect(post).not_to be_valid
    end
  end

  describe 'method' do
    before do
      6.times do |comment|
        Comment.create(
          post:,
          author: user,
          text: "Comment number #{comment}"
        )
      end
    end

    it 'recent_comments should return 5 most recent comments for a post' do
      expect(post.recent_comments.length).to eq(5)
      expect(post.comments_counter).to eq(6)
    end

    it 'update_post_counter should updates the posts counter for a user' do
      expect(user.posts_counter).to eq(1)
      post.send(:update_post_counter)
      expect(user.posts_counter).to eq(2)
      post.send(:update_post_counter)
      expect(user.posts_counter).to eq(3)
    end
  end
end
