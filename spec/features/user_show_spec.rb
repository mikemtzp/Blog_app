require 'rails_helper'

RSpec.describe 'user_show', type: :feature do
  user = User.find_by(name: 'Tom')
  posts = user.recent_posts

  before(:each) do
    visit user_path(user.id)
  end

  it 'should show the user\'s profile picture' do
    expect(page).to have_xpath("//img[contains(@src,'#{user.photo}')]")
  end

  it 'should show the user\'s username' do
    expect(page).to have_content(user.name)
  end

  it 'shoud show the number of posts the user has written' do
    expect(page).to have_content("Number of posts: #{user.posts_counter}")
  end

  it 'should show the user\'s bio' do
    expect(page).to have_content(user.bio)
  end

  it 'should show a button that lets me view all of a user\'s posts' do
    button = page.find('button#all-posts')
    expect(button).to have_content('See all posts')
  end

  it "redirect to the post's show page when clicking on a specific user\s post" do
    click_on posts.first.title
    expect(current_path).to eq("/users/#{user.id}/posts/#{posts.first.id}")
  end

  it "redirect to the post's index page when clicking see all posts button" do
    click_link 'See all posts'
    expect(current_path).to eq("/users/#{user.id}/posts")
  end
end
