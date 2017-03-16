Rails.application.routes.draw do
  resources :audit_logs, except: [:new, :edit, :destroy] do
    member do
      get :confirm
    end
  end
  namespace :admin do
    resources :users
    resources :requests
    resources :admin_users
    resources :employees
    resources :payroll_records
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
