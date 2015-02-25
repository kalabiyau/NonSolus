Rails.application.routes.draw do

  root 'application#index'

  resources :activities

  resources :users do
    member do
      post :update
      get :show
      post :update
    end
  end

  namespace :saml do
    get :init
    post :consume
    get :logout
  end

end
