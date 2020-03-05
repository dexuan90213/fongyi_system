Rails.application.routes.draw do
  devise_for :users

  root 'orders#index'

  resources :areas, except: [:show]
  resources :customers, except: [:show]
  resources :products, except: [:show]
  resources :orders
end
