Rails.application.routes.draw do
  resources :bookings_results
  resources :results
  get 'bookings_service_offers/bulk_create'
  root  to: 'pages#home'
  get 'dashboard', to: 'pages#dashboard'
  get 'choose-services', to: 'pages#choose_services'
  resources :service_offers, path: 'services-offered'
  resources :establishments
  resources :cities
  resources :provinces
  resources :bookings do
    member do
      get 'card'
    end
  end
  devise_for :users
  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html

  # Reveal health status on /up that returns 200 if the app boots with no exceptions, otherwise 500.
  # Can be used by load balancers and uptime monitors to verify that the app is live.
  get "up" => "rails/health#show", as: :rails_health_check

  resources :bookings_service_offers, path: 'booking-service-offers', only: [:index, :destroy] do
    collection do
      post :bulk_create
    end
  end

  # Defines the root path route ("/")
  # root "posts#index"
end
