Rails.application.routes.draw do
  root 'posts#index'
  
  # get 'posts/index'
  # get 'posts/show'
  # get 'posts/new'
  # get 'posts/create'
  # get 'posts/destroy'

  get 'sessions/new'
  get 'sessions/destroy'
  post 'sessions/create'

  get 'users/show'
  get 'users/new'
  # match '/users/create' => 'users#create', via: :post
  post 'users/create'

  resources :posts

end