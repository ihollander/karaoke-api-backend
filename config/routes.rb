Rails.application.routes.draw do
  resources :playlists
  resources :songs
  namespace :api do
    namespace :v1 do
      resources :rooms, only: [:index, :show, :create] do
        resources :users, only: [:index, :create, :destroy]
        resources :songs, only: [:index, :create]
        resources :playlists, only: [:index, :create, :destroy, :update]
      end 
    end
  end
end
