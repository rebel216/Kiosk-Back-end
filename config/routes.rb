# frozen_string_literal: true

Rails.application.routes.draw do
  devise_for :users, defaults: { format: :json }

  namespace :api do
    namespace :v1 do
      resources :transactions do
        collection do
          post :response_handler
        end
      end
      resources :parcels, only: [:index, :create, :show, :destroy]
      resources :parcelcopies, only: [:index, :create, :show, :destroy]
      resources :users, only: %i[index] do
        resources :postoffices, only: [:index, :show, :create, :destroy]
      end

      post 'users/login' => 'users#login'
      post 'users/signup' => 'users#signup'
    end
  end
end
