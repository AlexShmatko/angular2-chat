Rails.application.routes.draw do
  namespace :api do
    namespace :v1 do
      post 'signin' => 'sessions#create'
      post 'signup' => 'users#create'
    end
  end
end
