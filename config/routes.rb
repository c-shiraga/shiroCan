Rails.application.routes.draw do
  devise_for :users
  root "top#index"
  get "account/show" => "accounts#show"
  resources :books, only: [:create, :index, :destroy, :show, :new]
  resources :chat
end
