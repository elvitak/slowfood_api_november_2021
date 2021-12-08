Rails.application.routes.draw do
  namespace :api do
    resources :orders, only: [:create, :update]
  end
end
