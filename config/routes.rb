Rails.application.routes.draw do
  root "home#index"
  get    '/login',   to: 'sessions#new'
  post   '/login',   to: 'sessions#create'
  delete '/logout',  to: 'sessions#destroy'


  namespace :admin do
    resource :dashboard, only: [:show]
  end

  resources :users, only: [:new, :create]
  resources :playlists
  resources :songs
  resources :genres
  resources :albums
  resources :artists
  resources :favorite_songs
  resources :playlist_songs
  
 
end
