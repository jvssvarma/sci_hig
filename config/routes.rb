Rails.application.routes.draw do
  resources :audit_logs
  namespace :admin do
    resources :users
    resources :requests
    resources :admin_users
    root to: "users#index"
  end

  resources :requests
  devise_for :users, skip: [:registrations]
  root "welcome#index"
end
