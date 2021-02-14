Rails.application.routes.draw do

  resources :fish

  resources :licence_issuers do
    resources :fish_wardens
  end

  resources :countries do
    resources :locations
    resources :fisheries
  end

  resources :body_of_waters

  resources :fishing_areas do
    resources :comments
  end

  devise_for :users
  #root to: 'home#index'
  root to: 'fishing_areas#index'
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end
