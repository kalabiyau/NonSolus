Rails.application.routes.draw do

  root 'application#index'

  namespace :api, module: 'api', defaults: { format: 'json' } do
    api_version(module: 'V1', header: { name: 'Accept', value: 'application/vnd.act.suse.de; version=1' }, default: true) do
      resources :activities, only: [ :index, :show ] do
        collection do
          get :search
        end
      end
    end
  end

  resources :activities do
    member do
      post :join
    end
  end

  resources :users, only: [ :index, :show ]

  namespace :saml do
    get :init
    post :consume
    get :logout
  end

end
