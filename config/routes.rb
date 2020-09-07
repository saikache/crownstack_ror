Rails.application.routes.draw do
  scope :api do
    resources :products, only: [:index] do
      member do
        post 'add_to_cart'
      end
    end
    resources :users, only: [:create] do
      collection do
        get 'cart'
      end
    end
    resources :auth, only: [] do
      collection do
        post 'login'
      end
    end
  end
end
