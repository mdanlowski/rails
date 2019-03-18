Rails.application.routes.draw do
  root 'feeds#index'

  get "feeds/filter", controller: "feeds", action: "filter"
  post "feeds/prevalidate", controller: "feeds", action: "prevalidate"

  resources :feeds
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
