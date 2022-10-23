Rails.application.routes.draw do
  resources :billing_addresses, :only => [:index, :new, :create]

  get "billing_addresses/success", to: "billing_addresses#success"

  root to: "pages#home"
end
