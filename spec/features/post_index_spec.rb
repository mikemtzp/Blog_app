require 'rails_helper'

RSpec.describe 'post_index', type: :feature do
  user = User.find_by(name: 'Tom')
  post = Post.where(author_id: user.id).last
  comment = post.recent_comments

  before(:each) do
    visit user_posts_path(user.id)
  end

  it 'should see the user\'s profile picture' do
    expect(page).to have_xpath("//img[contains(@src,'#{user.photo}')]")
  end

  it 'should show the user\'s username' do
    expect(page).to have_content(user.name)
  end

  it 'should show the number of posts a user has written' do
    expect(page).to have_content("Number of posts: #{user.posts_counter}")
  end

  it 'should show a post\'s title' do
    expect(page).to have_content(post.title)
  end

  it 'should show some of the post\'s body' do
    expect(page).to have_content(post.text)
  end

  it 'should show the first comments on a post' do
    expect(page).to have_content(comment[0].text)
    expect(page).to have_content(comment[1].text)
    expect(page).to have_content(comment[2].text)
    expect(page).to have_content(comment[3].text)
    expect(page).to have_content(comment[4].text)
  end

  it 'should show how many comments a post has' do
    expect(page).to have_content(post.comments_counter)
  end

  it 'should show how many likes a post has' do
    expect(page).to have_content(post.likes_counter)
  end

  it "redirect to the post's show page when clicking on a post" do
    click_on post.title
    expect(current_path).to eq("/users/#{user.id}/posts/#{post.id}")
  end
end
