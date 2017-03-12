Rails.application.routes.draw do
  resources :audit_logs, except: [:new, :edit, :destroy]
  namespace :admin do
    resources :users
    resources :requests
    resources :admin_users
    root to: "users#index"
  end

  resources :requests do
    member do
      get :approve
    end
  end
  devise_for :users, skip: [:registrations]
  root "welcome#index"
end
