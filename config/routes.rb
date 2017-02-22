Rails.application.routes.draw do
  resources :requests
  devise_for :users, skip: [:registrations]
  root "welcome#index"
end
