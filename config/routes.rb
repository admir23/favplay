Rails.application.routes.draw do
  root "home#index"
  get    '/login',   to: 'sessions#new'
  post   '/login',   to: 'sessions#create'
  delete '/logout',  to: 'sessions#destroy'

  post '/song:id/favorite', to: 'songs#favorite', as: :favorite
  delete '/song:id/favorite', to: 'favorites#destroy', as: :destroy
  
  namespace :admin do
    resource :dashboard, only: [:show]
  end

  resources :users, only: [:new, :create]
  resources :playlists
  resources :genres
  resources :albums
  resources :artists
  resources :playlist_songs
  resources :favorites
  resources :songs

end
