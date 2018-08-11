Rails.application.routes.draw do
  namespace :admin do
    root 'projects#index'

    resources :projects
    resources :jobs
    resources :copies
    resources :configs
  end

  root 'home#index'
  get 'about' => 'home#about'
  get 'contacts' => 'home#contacts'

  resources :projects, only: %i[index show]
  resources :jobs, only: %i[index show]
end
