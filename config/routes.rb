Rails.application.routes.draw do
  resources :users do
    resources :tickets, only: [:index]
  end
  resources :tickets
end
