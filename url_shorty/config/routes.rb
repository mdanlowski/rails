Rails.application.routes.draw do
  root 'redirs#new'
  get 'redirs/new'
  
  # redir creation
  post 'redirs/create', controller: 'redirs', action: 'create'

  # to remain consistent with REST and yet have only hash after hostname
  match 'redirs/show(/:id)', controller: 'redirs', action: 'show', via: :get
  match '(:id)', to: 'redirs/show(/:id)', controller: 'redirs', action: 'show', via: :get

  # alternative would be:
  # resources :redirs, only: [:new, :show, :create]

end
