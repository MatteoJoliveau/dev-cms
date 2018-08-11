Rails.application.routes.draw do
  namespace :admin do
    root to: 'projects#index'

    resources :projects
    resources :jobs
    resources :copies
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
  get 'about' => 'home#about'
  get 'contacts' => 'home#contacts'

  resources :projects, only: %i[index show]
  resources :jobs, only: %i[index show]
end
