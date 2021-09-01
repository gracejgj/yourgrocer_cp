Rails.application.routes.draw do
  devise_for :users
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html

  root 'pages#home'

    resources :users
    resources :products, only: [:show] do
      resources :orders do
        get 'success'
        get 'cancel'
        get 'payment_details'
      end
    end

    resources :stripes, only: [:create]

    namespace :platform do
      get '/home', to: 'pages#host_home'

      resources :dashboards, only: [:show]
      resources :vendors
      resources :products do
        member do
          delete :delete_photo_attachment
        end
      end
    end
end
