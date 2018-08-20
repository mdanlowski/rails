Rails.application.routes.draw do
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  root 'citations#index' # , as: 'home'

  # get 'citations/index'

  resources :citations
  # Automatically provided through resources
#		   root GET    /                             citations#index
#     citations GET    /citations(.:format)          citations#index
#               POST   /citations(.:format)          citations#create
#  new_citation GET    /citations/new(.:format)      citations#new
# edit_citation GET    /citations/:id/edit(.:format) citations#edit
#      citation GET    /citations/:id(.:format)      citations#show
#               PATCH  /citations/:id(.:format)      citations#update
#               PUT    /citations/:id(.:format)      citations#update
#               DELETE /citations/:id(.:format)      citations#destroy
# 

end