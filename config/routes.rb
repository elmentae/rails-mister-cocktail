Rails.application.routes.draw do
  devise_for :users
  root to: "cocktails#index"
  resources :cocktails, only: [:index, :show, :new, :create, :destroy] do
    resources :doses, only: [:new, :create]
  end
end
