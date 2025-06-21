Rails.application.routes.draw do
  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html

  # Reveal health status on /up that returns 200 if the app boots with no exceptions, otherwise 500.
  # Can be used by load balancers and uptime monitors to verify that the app is live.
  get "up" => "rails/health#show", as: :rails_health_check

  # Authentication routes
  get '/login', to: 'sessions#new'
  post '/login', to: 'sessions#create'
  delete '/logout', to: 'sessions#destroy'
  
  # Dashboard
  root 'dashboard#index'
  
  # Resources
  resources :users
  resources :subjects do
    member do
      post 'enroll/:user_id', to: 'subjects#enroll', as: 'enroll'
      delete 'unenroll/:user_id', to: 'subjects#unenroll', as: 'unenroll'
    end
  end
  resources :monitorships, except: [:edit, :update]
end
