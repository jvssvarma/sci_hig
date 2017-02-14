Rails.application.routes.draw do
  resources :requests
  devise_for :users
  root "welcome#index"
end
