Rails.application.routes.draw do
  get 'pages/index'
  get 'pages/profile'

  root 'pages#index'

  resources :users
  resources :skills

  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
