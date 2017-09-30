Rails.application.routes.draw do
  get '/404', :to => 'errors#not_found'
  get '/505', :to => 'errors#internal_server_error'

  root "home#index"
  get    '/login',   to: 'sessions#new'
  post   '/login',   to: 'sessions#create'
  delete '/logout',  to: 'sessions#destroy'

  # Add and destroy song to/from favorites
  post '/song:id/favorite', to: 'songs#favorite', as: :favorite
  delete '/song:id/favorite', to: 'favorites#destroy', as: :destroy
  
  namespace :superadmin do
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
