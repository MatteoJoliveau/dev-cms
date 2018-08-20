# frozen_string_literal: true

Rails.application.routes.draw do
  namespace :admin do
    root to: 'projects#index'

    resources :projects
    resources :jobs
    resources :copies
    resources :pages
    resources :configs
    resources :admins
  end

  scope :admin do
    resources :passwords, controller: 'clearance/passwords', only: %i[create new]
    resource :session, controller: 'clearance/sessions', only: [:create]

    resources :admins, controller: 'clearance/users', only: [:create] do
      resource :password, controller: 'clearance/passwords', only: %i[create edit update]
    end

    get '/sign_in' => 'clearance/sessions#new', as: 'sign_in'
    delete '/sign_out' => 'clearance/sessions#destroy', as: 'sign_out'
  end

  root 'home#index'

  resources :projects, only: %i[index show]
  resources :jobs, only: %i[index show]

  get 'sitemap.xml' => 'sitemap#index', defaults: { format: 'xml' }
  get 'health' => 'health#index'

  get '*path', to: 'pages#show', constraints: lambda { |req|
    # This constraint is needed because otherwise active_storage routes are catched and don't work
    req.path.exclude? 'rails/active_storage'
  }

  # TODO: migrate them to pages
  get 'about' => 'home#about'
  get 'contacts' => 'home#contacts'
end
