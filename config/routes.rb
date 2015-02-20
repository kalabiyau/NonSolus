Rails.application.routes.draw do

  root 'application#index'

  resources :activities do
    member do
      post :join
    end
  end

  resources :users

  namespace :saml do
    get :init
    post :consume
    get :logout
  end

end
