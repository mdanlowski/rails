Rails.application.routes.draw do
  # SHORTHAND MATCH ROUTE:
  get 'pages/index'
  get 'pages/hello'		# pages#hello doesnt have to exist but Rails renders using sensible defaults
  get 'pages/user_panel'
  get 'pages/login'

  # STANDARD MATCH ROUTE:
  match 'pages/contact', :to => "pages#contact", :via => :get

  get 'pages/about'
 
  # ROOT ROUTE
  root 'aliens#ayylmao' # same as: match '/', :to => "aliens/ayylmao", :via => :get

  # DEFAULT ROUTES:
  # get ':controller(/:action(/:id(/:unicorn)))' # () parts are optional and can be omitted
  # or: match ':controller(/:action(/:id))', :via => :get


end

