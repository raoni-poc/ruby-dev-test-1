Rails.application.routes.draw do
  devise_for :users

  resources :folders
  resources :files
end
