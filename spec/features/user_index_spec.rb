require 'rails_helper'

RSpec.describe 'user_index', type: :feature do
  first_user = User.find_by(name: 'Tom')
  second_user = User.find_by(name: 'Lilly')

  before(:each) do
    visit users_path
  end

  it 'should show the username of all other users' do
    expect(page).to have_content(first_user.name)
    expect(page).to have_content(second_user.name)
  end

  it 'should see the profile picture for each user' do
    expect(page).to have_xpath("//img[contains(@src,'#{first_user.photo}')]")
    expect(page).to have_xpath("//img[contains(@src,'#{second_user.photo}')]")
  end

  it 'shoud show the number of posts each user has written' do
    expect(page).to have_content("Number of posts: #{first_user.posts_counter}")
    expect(page).to have_content("Number of posts: #{second_user.posts_counter}")
  end

  it "redirect to the user's show page when clicking on it" do
    click_on first_user.name
    expect(current_path).to eq("/users/#{first_user.id}")
    click_link 'Go to all users'
    click_on second_user.name
    expect(current_path).to eq("/users/#{second_user.id}")
  end
end
