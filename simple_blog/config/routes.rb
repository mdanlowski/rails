Rails.application.routes.draw do
  get 'pages/about'
  get 'pages/contact'
  root 'posts#index'
  
  # get 'posts/index'
  # get 'posts/show'
  # get 'posts/new'
  # get 'posts/create'
  # get 'posts/destroy'
  get 'posts/featured'
  patch 'posts/process_vote/:id/:vote_value', controller: 'posts', action: 'process_vote'

  get 'sessions/new'
  delete 'sessions/destroy'
  post 'sessions/create'

  get 'users/show'
  # match 'users/:id' => 'users#show', via: :get
  # get 'users/show/:id', to: 'users#show'
  # get 'users/:id', to: 'users#show'
  get 'users/edit'
  get '/users/:id/edit', to: 'users#edit'
  get 'users/new' #, as: :new_user # @TODO what dat for
  match '/users/:id/' => 'users#update', via: :patch, :as => :user
  # patch '/users/:id/edit', controller: 'users', action: 'update'


  # post 'users' => 'users#create'
  post 'users/create'
  # patch 'users/show'

  resources :posts#, :users

end


#     posts GET    /posts(.:format)             	posts#index
#           POST   /posts(.:format)             	posts#create
#  new_post GET    /posts/new(.:format)         	posts#new
# edit_post GET    /posts/:id/edit(.:format)    	posts#edit
#      post GET    /posts/:id(.:format)         	posts#show
#           PATCH  /posts/:id(.:format)         	posts#update
#           PUT    /posts/:id(.:format)         	posts#update
#           DELETE /posts/:id(.:format)         	posts#destroy