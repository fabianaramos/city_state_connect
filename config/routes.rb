require 'sidekiq/web'
# or require 'sidekiq/pro/web'
# or require 'sidekiq-ent/web'

Rails.application.routes.draw do
  root 'states#index'

  resources :states do
    resources :cities
  end
  resources :import_cities_jobs, only: %i[index show create]
  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html

  # Reveal health status on /up that returns 200 if the app boots with no exceptions, otherwise 500.
  # Can be used by load balancers and uptime monitors to verify that the app is live.
  get 'up' => 'rails/health#show', as: :rails_health_check

  # Defines the root path route ("/")
  # root "posts#index"
  mount Sidekiq::Web => '/sidekiq' # mount Sidekiq::Web in your Rails app
end
