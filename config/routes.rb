Rails.application.routes.draw do
  resources :playlists
  resources :songs
  namespace :api do
    namespace :v1 do
      resources :rooms, only: [:index, :show, :create] do
        resources :users, only: [:index, :create]
        resources :songs, only: [:index, :create, :destroy]
      end 
    end
  end
end
