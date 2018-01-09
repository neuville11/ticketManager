Rails.application.routes.draw do
  resources :schools
  resources :staffs
  resources :coordinators
  resources :administratives
  devise_for :users
  resources :events
  resources :tickets
  root "events#index"
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
