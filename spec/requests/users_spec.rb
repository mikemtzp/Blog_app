require 'rails_helper'

RSpec.describe 'Users', type: :request do
  describe 'GET /users' do
    before { get users_path }
    it 'returns a 200 status code' do
      expect(response).to have_http_status(:ok)
    end

    it 'renders the users template' do
      expect(response).to render_template('users/index')
      expect(response).to render_template('layouts/application')
    end

    it 'includes correct placeholder text for /users' do
      expect(response.body).to include 'Here is a the list of all users'
    end
  end

  describe 'GET /user/id' do
    before do
      user = User.create(name: 'Kenobi', posts_counter: 0)
      get user_path(user.id)
    end

    it 'returns a 200 status code' do
      expect(response).to have_http_status(:ok)
    end

    it 'renders the users/id template' do
      user = User.create(name: 'Kenobi', posts_counter: 0)
      get user_path(user.id)
      expect(response).to render_template('users/show')
      expect(response).to render_template('layouts/application')
    end

    it 'includes correct placeholder text for /users/id' do
      expect(response.body).to include 'Here is a specific user for a given user id'
    end
  end
end
