Rails.application.routes.draw do
  resources :questions
  resources :purposes
  resources :rda_especifics
  resources :rda_generals
  resources :programs
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
