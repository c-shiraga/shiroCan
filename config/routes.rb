Rails.application.routes.draw do
  devise_for :users
  root "top#index"
  get "account/show" => "accounts#show"
end
