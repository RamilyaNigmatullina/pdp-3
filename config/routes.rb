Rails.application.routes.draw do
  devise_for :users, controllers: { registrations: "users/registrations" }
  root to: "posts#index"

  resources :posts, only: %i[index show]

  namespace :admin do
    resources :posts, only: %i[new create edit update destroy]
  end
end
