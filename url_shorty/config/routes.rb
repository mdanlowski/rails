Rails.application.routes.draw do
  root 'redirs#new'

  get 'redirs/new'
  post 'redirs/create', controller: 'redirs', action: 'create'
  match 'redirs/track(/:id)', controller: 'redirs', action: 'track', via: :get
  match '(:id)', to: 'redirs/track(/:id)', controller: 'redirs', action: 'track', via: :get

end
