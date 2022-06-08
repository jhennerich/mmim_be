Rails.application.routes.draw do

  namespace :api do
    namespace :v1 do
      put '/users', to: 'users#update'
      get 'find_user', to: 'users#find'
      resources :users, only: [:create]
      resources :search, only: [:index]
      resources :search_by_user, only: [:index]
    end
  end
end
