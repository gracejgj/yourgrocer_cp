Rails.application.routes.draw do
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html

    devise_for :vendors
    devise_for :users

  root 'pages#home'

    resources :users
    resource :cart, only: [:show] do
      put 'add/:product_id', to: 'carts#add', as: :add_to
      put 'remove/:product_id', to: 'carts#remove', as: :remove_from
    end

    resources :products, only: [:show] do
      resources :orders do
        get 'success'
        get 'cancel'
        get 'payment_details'
      end
    end

    resources :stripes, only: [:create]

    namespace :platform do
      get '/home', to: 'pages#vendor_home'

      resources :dashboards, only: [:show]
      resources :vendors
      resources :products do
        member do
          delete :delete_photo_attachment
        end
      end
    end
end
