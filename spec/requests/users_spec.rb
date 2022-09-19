require 'rails_helper'

RSpec.describe 'Users', type: :request do
  describe 'GET /users' do
    it 'returns a 200 status code' do
      get users_path
      expect(response).to have_http_status(:ok)
    end

    it 'renders the users template' do
      get users_path
      expect(response).to render_template('users/index')
      expect(response).to render_template('layouts/application')
    end

    it 'includes correct placeholder text for /users' do
      get users_path
      expect(response.body).to include 'Here is a the list of all users'
    end
  end
end
