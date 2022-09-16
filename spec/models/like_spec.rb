require 'rails_helper'

RSpec.describe Like, type: :model do
  subject(:user) do
    User.create(name: 'Kenobi', posts_counter: 0)
  end

  subject(:post) do
    Post.create(title: 'The Revenge of the Sith', comments_counter: 0, likes_counter: 0, author: user)
  end

  subject(:like) do
    Like.create(post:, author: user)
  end

  describe 'method' do
    it 'update_likes_counter should updates the likes counter for a post' do
      expect(post.likes_counter).to eq(0)
      like.send(:update_likes_counter)
      expect(post.likes_counter).to eq(2)
    end
  end
end
