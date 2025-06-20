Rails.application.routes.draw do
  # API Routes
  namespace :api do
    namespace :v1 do
      devise_for :users,
                 path: '',
                 path_names: {
                   sign_in: 'login',
                   sign_out: 'logout',
                   registration: 'signup'
                 },
                 controllers: {
                   sessions: 'api/v1/sessions',
                   registrations: 'api/v1/registrations'
                 }
      
      # Outras rotas da API
      resources :examples, only: [:index]
    end
  end

  # Frontend Routes
  root 'home#index'
  get 'dashboard', to: 'dashboard#index'

  # Sidekiq Web UI (protegido em produção)
  require 'sidekiq/web'
  mount Sidekiq::Web => '/sidekiq'
end