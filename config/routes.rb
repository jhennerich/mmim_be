Rails.application.routes.draw do

  namespace :api do
    namespace :v1 do
      put '/users', to: 'users#update'
      get 'user_meetings', to: 'user_meetings#index'
      resources :users, only: [:create]
      resources :search, only: [:index]
      resources :search_by_user, only: [:index]
    end
  end
end
