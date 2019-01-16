Rails.application.routes.draw do
  root 'pages#index'
  get 'pages/index'
  get 'pages/featured'
  get 'pages/about'
  get 'pages/contact'
  # match '/index' => 'pages#index', :via => :get
  # match '/featured' => 'pages#featured', :via => :get
  # match '/about' => 'pages#about', :via => :get
  # match '/contact' => 'pages#contact', :via => :get

  # get 'users/register'
  # get 'users/login'
  match '/register' => 'users#new', :via => :get
  match '/login' => 'sessions#new', :via => :get
  match '/login' => 'sessions#create', :via => :post
  match 'users/create' => 'users#create', :via => :post

  resources :posts
  # resources :users

end

   #         Prefix Verb   URI Pattern                               Controller#Action
   #           root GET    /                                         pages#index
   #    pages_index GET    /pages/index(.:format)                    pages#index
   # pages_featured GET    /pages/featured(.:format)                 pages#featured
   #    pages_about GET    /pages/about(.:format)                    pages#about
   #  pages_contact GET    /pages/contact(.:format)                  pages#contact
   #          index GET    /index(.:format)                          pages#index
   #       featured GET    /featured(.:format)                       pages#featured
   #          about GET    /about(.:format)                          pages#about
   #        contact GET    /contact(.:format)                        pages#contact
   #          posts GET    /posts(.:format)                          posts#index
   #                POST   /posts(.:format)                          posts#create
   #       new_post GET    /posts/new(.:format)                      posts#new
   #      edit_post GET    /posts/:id/edit(.:format)                 posts#edit
   #           post GET    /posts/:id(.:format)                      posts#show
   #                PATCH  /posts/:id(.:format)                      posts#update
   #                PUT    /posts/:id(.:format)                      posts#update
   #                DELETE /posts/:id(.:format)                      posts#destroy
