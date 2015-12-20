Rails.application.routes.draw do
  resources :playlists
  resources :artists do
    resources :songs, shallow: true
    # resources :songs, only: [:new, :create, :edit]
  end

  # resources :songs, only: [:show]
  root 'artists#index'
  # get '/songs', to: 'songs#index'
  resources :songs, only: [:index]
  resources :playlists


end
