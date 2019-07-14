Rails.application.routes.draw do
  devise_for :users, controllers: { registrations: "users/registrations" }
  root to: "posts#index"

  resources :posts, only: %i[index show]
  resources :subscribers, only: %i[create destroy]

  namespace :admin do
    resources :posts, only: %i[new create edit update destroy] do
      resource :approval, module: :posts, only: :create
      resource :rejection, module: :posts, only: :create
    end
    resources :pending_posts, only: :index
    resources :rejected_posts, only: :index
  end
end
