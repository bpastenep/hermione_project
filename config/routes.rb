Rails.application.routes.draw do
  resources :evaluations
  devise_for :users
  resources :questions
  resources :purposes
  resources :rda_especifics
  resources :rda_generals
  resources :programs
  root to: 'home#index'

  
match '/demo',   to: 'tables#demo',   via: [:get, :post]
match '/demo/delete',   to: 'tables#demo_delete',   via: [:post]
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
