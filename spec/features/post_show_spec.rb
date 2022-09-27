require 'rails_helper'

RSpec.describe 'post_show', type: :feature do
  user = User.find_by(name: 'Tom')
  post = Post.where(author_id: user.id).first
  comment = Comment.where(post_id: post.id).first

  before(:each) do
    visit user_post_path(user.id, post.id)
  end

  it 'should show a post\'s title' do
    expect(page).to have_content(post.title)
  end

  it 'should show who wrote the post' do
    expect(page).to have_content(user.name)
  end

  it 'should show how many comments a post has' do
    expect(page).to have_content(post.comments_counter)
  end

  it 'should show how many likes a post has' do
    expect(page).to have_content(post.likes_counter)
  end

  it 'should show a post\'s body' do
    expect(page).to have_content(post.text)
  end

  it 'should show the username of each commentor' do
    expect(page).to have_content(comment.author.name)
  end

  it 'should show the comment each commentor left.' do
    expect(page).to have_content(comment.text)
  end
end
