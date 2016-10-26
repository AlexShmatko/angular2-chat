Rails.application.routes.draw do
  namespace :api do
    namespace :v1 do
      post 'signin' => 'sessions#create'
      get 'singout' => 'sessions#destroy'
      post 'signup' => 'users#create'

      resources :users
    end
  end
end
