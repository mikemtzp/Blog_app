Rails.application.routes.draw do
  get 'users/:user_id/posts/new', to: 'posts#new', as: 'new_post'
  get 'users/:user_id/posts', to: 'posts#index', as: 'user_posts'
  get 'users/:user_id/posts/:id', to: 'posts#show', as: 'user_post'
  get 'users', to: 'users#index'
  get 'users/:id', to: 'users#show', as: 'user'
  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html

  # Defines the root path route ("/")
  # root 'users#index'
end
