Rails.application.routes.draw do

  namespace :api do
    namespace :v1 do
      put '/users', to: 'users#update'
      resources :users, only: [:create]
      resources :search, only: [:index]
      resources :search_by_user, only: [:index]
      resources :meeting, only: [:create]
    end
  end
end
