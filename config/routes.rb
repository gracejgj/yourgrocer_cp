Rails.application.routes.draw do
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html

    devise_for :vendors
    devise_for :users

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
      get '/home', to: 'pages#vendor_home'

      resources :dashboards, only: [:show]
      resources :vendors
      resources :products do
        member do
          delete :delete_photo_attachment
        end
      end
    end

    scope :webhooks do
      post 'payment-success-callback', to: 'webhooks#payment_success_callback', as: :payment_callback
    end

    mount StripeEvent::Engine, at: 'webhooks/payment-success-callback'
end
