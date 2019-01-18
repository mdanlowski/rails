Rails.application.routes.draw do
  root 'posts#index'
  
  # get 'posts/index'
  # get 'posts/show'
  # get 'posts/new'
  # get 'posts/create'
  # get 'posts/destroy'

  get 'sessions/new'
  delete 'sessions/destroy'
  post 'sessions/create'

  get 'users/show'
  get 'users/new' #, as: :new_user # @TODO what dat for
  # match '/users/create' => 'users#create', via: :post
  # post 'users' => 'users#create'
  post 'users/create'

  resources :posts

end


#     posts GET    /posts(.:format)             	posts#index
#           POST   /posts(.:format)             	posts#create
#  new_post GET    /posts/new(.:format)         	posts#new
# edit_post GET    /posts/:id/edit(.:format)    	posts#edit
#      post GET    /posts/:id(.:format)         	posts#show
#           PATCH  /posts/:id(.:format)         	posts#update
#           PUT    /posts/:id(.:format)         	posts#update
#           DELETE /posts/:id(.:format)         	posts#destroy