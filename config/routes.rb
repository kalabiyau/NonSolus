Rails.application.routes.draw do

  root 'application#index'

  resources :activities

  resources :users, only: [:update, :show]

  namespace :saml do
    get :init
    post :consume
    get :logout
  end

end
