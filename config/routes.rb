Rails.application.routes.draw do
  namespace :api do
    resources :offers, only: [:index, :create, :show]
  end
end
