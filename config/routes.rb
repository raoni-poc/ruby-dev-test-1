Rails.application.routes.draw do
  devise_for :users

  resources :folders
  resources :file_records
end
