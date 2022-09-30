Rails.application.routes.draw do
  devise_for :users
  devise_scope :user do
    get 'login', to: 'devise/sessions#new'
  end

  resources :users, only: %i[index show] do
    resources :posts, only: %i[index new create show destroy] do
      resources :comments, only: %i[new create destroy]
      resources :likes, only: [:create]
    end
  end

  namespace :api do
    namespace :v1 do
      resources :users, only: [:index] do
        resources :posts, only: [:index], format: :json do
          resources :comments, only: %i[index new create], format: :json
          resources :likes, only: [:create]
        end
      end
    end
  end

  root 'users#index'
end
