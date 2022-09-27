Rails.application.routes.draw do
  devise_for :users
  post 'users/:user_id/posts/:post_id/likes', to: 'likes#create', as: 'user_post_likes'
  post 'users/:user_id/posts/:post_id/comments', to: 'comments#create', as: 'user_post_comments'
  get 'users/:user_id/posts/:post_id/new-comment', to: 'comments#new', as: 'new_user_post_comment'
  post 'users/:user_id/posts', to: 'posts#create'
  get 'users/:user_id/posts/new', to: 'posts#new', as: 'new_user_post'
  get 'users/:user_id/posts', to: 'posts#index', as: 'user_posts'
  get 'users/:user_id/posts/:id', to: 'posts#show', as: 'user_post'
  get 'users', to: 'users#index'
  get 'users/:id', to: 'users#show', as: 'user'

  # Define the same routes with:
  # resources :users, only: [:index, :show] do
  #   resources :posts, only: [:index, :new, :create, :show] do
  #     resources :comments, only: [:new, :create]
  #     resources :likes, only: [:create]
  #   end
  # end

  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html

  # Defines the root path route ("/")
  root 'users#index'
end
