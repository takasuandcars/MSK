Rails.application.routes.draw do
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
    get "/", to: "receiveds#new"
    resources :pickup_requests, only: [:create]
    resources :receiveds, only: [:create]

end
