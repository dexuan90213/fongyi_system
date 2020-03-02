Rails.application.routes.draw do
  devise_for :users

  resources :areas, except: [:show]
  resources :customers
end
