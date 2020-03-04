Rails.application.routes.draw do
  devise_for :users

  resources :areas, except: [:show]
  resources :customers, except: [:show]
  resources :products, except: [:show]
end
