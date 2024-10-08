Rails.application.routes.draw do
  devise_for :users
  root to: "pages#home"
  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html

  # Reveal health status on /up that returns 200 if the app boots with no exceptions, otherwise 500.
  # Can be used by load balancers and uptime monitors to verify that the app is live.
  get "up" => "rails/health#show", as: :rails_health_check

  # Define routes for venues
  get "profile", to: "pages#profile"
  get "search", to: "pages#search"
  
  resources :venues do
    resources :bookings, only: [:new, :create, :edit]
  end

  resources :bookings, only: [ :destroy, :update ]


  # Defines the root path route ("/")
  # root "posts#index"
end
