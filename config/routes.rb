Rails.application.routes.draw do
  root to: 'pages#home'

  devise_for :users

  resources :users
  resources :profiles
  resources :days

  get '/calendar' => 'application#calendar'

  namespace :api do
    resources :profiles
  end

end
