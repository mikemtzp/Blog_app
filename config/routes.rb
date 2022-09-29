Rails.application.routes.draw do
  devise_for :users
  devise_scope :user do
    get 'login', to: 'devise/sessions#new'
  end

  resources :users, only: %i[index show] do
    resources :posts, only: %i[index new create show destroy] do
      resources :comments, only: %i[new create destroy index]
      resources :likes, only: [:create]
    end
  end

  # Define the same routes with:
  # post 'users/:user_id/posts/:post_id/likes', to: 'likes#create', as: 'user_post_likes'
  # delete '/users/:user_id/posts/:post_id/comments/:id', to: 'comments#destroy', as: 'destroy_user_post_comment'
  # post 'users/:user_id/posts/:post_id/comments', to: 'comments#create', as: 'user_post_comments'
  # get 'users/:user_id/posts/:post_id/new-comment', to: 'comments#new', as: 'new_user_post_comment'
  # delete 'users/:user_id/posts/:id', to: 'posts#destroy', as: 'destroy_user_post'
  # post 'users/:user_id/posts', to: 'posts#create'
  # get 'users/:user_id/posts/new', to: 'posts#new', as: 'new_user_post'
  # get 'users/:user_id/posts', to: 'posts#index', as: 'user_posts'
  # get 'users/:user_id/posts/:id', to: 'posts#show', as: 'user_post'
  # get 'users', to: 'users#index'
  # get 'users/:id', to: 'users#show', as: 'user'

  root 'users#index'
end
