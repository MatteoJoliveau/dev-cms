Rails.application.routes.draw do
  namespace :admin do
    root 'projects#index'

    resources :projects
    resources :copies
  end

  root 'home#index'
  get 'about' => 'home#about'
  get 'contacts' => 'home#contacts'

  resources :projects, only: %i[index show]
end
