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
      subject.title = nil
      expect(subject).not_to be_valid
    end

    it 'title should not be too long' do
      subject.title = 'm' * 251
      expect(subject).not_to be_valid
    end

    it 'comments counter should be an integer' do
      subject.comments_counter = nil
      expect(subject).not_to be_valid
    end

    it 'comments counter should be an integer greater or equal to zero' do
      subject.comments_counter = -1
      expect(subject).not_to be_valid
    end

    it 'likes counter should be an integer' do
      subject.likes_counter = nil
      expect(subject).not_to be_valid
    end

    it 'likes counter should be an integer greater or equal to zero' do
      subject.likes_counter = -1
      expect(subject).not_to be_valid
    end
  end

  describe 'method' do
    it 'recent_comments length should be between 0 and 5' do
      expect(subject.recent_comments.length).to be_between(0, 5)
    end

    it 'update_post_counter should updates the posts counter for a user' do
      expect(user.posts_counter).to eq(0)
      post.send(:update_post_counter)
      expect(user.posts_counter).to eq(2)
    end
  end
end
