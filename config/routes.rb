Rails.application.routes.draw do
  namespace :admin do
    root 'projects#index'

    resources :projects
  end

  root 'home#index'
  resources :projects, only: %i[index show]
end
