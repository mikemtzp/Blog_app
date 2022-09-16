require 'rails_helper'

RSpec.describe User, type: :model do
  subject(:user) do
    User.create(name: 'Kenobi', posts_counter: 0)
  end

  describe 'validation' do
    it 'name should be present' do
      user.name = nil
      expect(user).not_to be_valid
    end

    it 'posts counter should be an integer' do
      user.posts_counter = nil
      expect(user).not_to be_valid
    end

    it 'posts counter should be an integer greater or equal to zero' do
      user.posts_counter = -1
      expect(user).not_to be_valid
    end
  end

  describe 'method' do
    before do
      4.times do |post|
        Post.create(
          title: "Post #{post}",
          author: user,
          comments_counter: 0,
          likes_counter: 0
        )
      end
    end

    it 'recent_posts should return 3 most recent posts for a user' do
      expect(user.recent_posts.length).to eq(3)
    end
  end
end
