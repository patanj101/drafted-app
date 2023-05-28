Rails.application.routes.draw do
  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html
  require 'sidekiq/web'

  authenticate :user do
    mount Sidekiq::Web => '/sidekiq'
  end

  unauthenticated :user do
    root to: redirect('/login')
  end
  root "accounts#index", as: :authenticated_root


  devise_for :users, path: '', path_names: {
    sign_in: 'login',
    sign_out: 'logout',
  }, controllers: {
    sessions: 'users/sessions'
  }

  # google_sign_in
  scope module: 'users' do
    get 'google_authentication/create', to: 'google_authentications#create', as: :create_google_authentication
  end

  ####
  #### account
  ####

  namespace :api  do
    get 'accounts', to: 'accounts#index', as: :index_api_accounts
  end

  resources :accounts, only: [:create]
  get 'accounts', to: 'accounts#index', as: :index_accounts
  get 'account/new', to: 'accounts#new', as: :new_account
  get 'account/:entity_id', to: 'accounts#show', as: :show_account
  # post 'account/', to: 'accounts#create', as: :create_account
  delete 'account/:entity_id', to: 'accounts#destroy', as: :destroy_account


  resources :report_imports, only: [:create]
  get 'account/:entity_id/report_import/new', to: 'report_imports#new', as: :new_report_import

end
