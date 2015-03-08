Rails.application.routes.draw do

  root 'activities#index'
  get :about, to: 'application#about'

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
    collection do
      post :search
    end
    member do
      post :join
    end
  end

  namespace :saml do
    get :init
    post :consume
    get :logout
  end

end
