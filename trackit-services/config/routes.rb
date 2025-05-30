Rails.application.routes.draw do
  namespace :api do
    resources :habits do
      member do
        post :mark_done
      end
    end
  end

  get "up" => "rails/health#show", as: :rails_health_check

  # Defines the root path route ("/")
  # root "posts#index"
end
