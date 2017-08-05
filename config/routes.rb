Rails.application.routes.draw do
  root "home#index"

  namespace :admin do
    resource :dashboard, only: [:show]
    resources :products
  end

  resources :categories
  resources :sellers do
    member do
      get :products
    end
  end
  resources :orders
  resources :users, only: [:new, :create]
  resource :about, only: [:show]
  resource :session, only: [:new, :create, :destroy]

  resources :products do
    collection do
      get :expensive
      get :cheap
    end
  end
end
