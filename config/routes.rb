Rails.application.routes.draw do

  root 'application#index'

  resources :activities

  namespace :saml do
    get :init
    post :consume
    get :logout
  end

end
