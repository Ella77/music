Rails.application.routes.draw do

  get 'index/index'
  get 'developers/index'
  get 'developers/new'
  get 'index/play'
  get 'index/rank'

  get 'message/index'
  get 'message/show'
  get 'message/new'
  root 'developers#new'
  resources :messages, :developers
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
