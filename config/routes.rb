Rails.application.routes.draw do
  root "articles#index"
  get "login" => "sessions#new", as: :login
  resource :session, only: [:create, :destroy]
  resources :articles, only: [:index, :new, :create, :edit, :update, :show]
end
