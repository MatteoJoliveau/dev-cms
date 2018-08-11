Rails.application.routes.draw do
  namespace :admin do
    root 'projects#index'

    resources :projects
  end

  root 'home#index'
end
