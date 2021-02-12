Rails.application.routes.draw do

  resources :licence_issuers
  resources :countries do
    resources :locations
    resources :fisheries
  end
  resources :body_of_waters
  resources :fishing_areas do
    resources :comments
  end

  devise_for :users
  root to: 'home#index'
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end
