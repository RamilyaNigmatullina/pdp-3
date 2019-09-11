Rails.application.routes.draw do
  devise_for :users, controllers: { registrations: "users/registrations" }
  root to: "posts#index"

  resources :posts, only: %i[index show]
  resources :subscribers, only: %i[show create destroy]

  namespace :admin do
    resources :posts, only: %i[new create edit update destroy] do
      resource :approval, module: :posts, only: :create
      resource :rejection, module: :posts, only: :create
    end
    resources :pending_posts, only: :index
    resources :rejected_posts, only: :index
  end

  namespace :users do
    resources :posts, only: [] do
      resources :likes, only: %i[create destroy], module: :posts
    end
  end
end
