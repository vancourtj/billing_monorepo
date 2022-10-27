Rails.application.routes.draw do
  resources :billing_addresses, :only => [:index, :new, :create]

  get "success", to: "pages#success"

  root to: "pages#home"
end
