Rails.application.routes.draw do
    root "static_pages#index"
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
    resources :pickup_requests, only: [:create]
    resources :receiveds, only: [:create, :update, :destroy]
    post "receiveds/update", to: "receiveds#update"
    get "/receiveds/show", to: "receiveds#show"
    get "/receveds/modify", to: "receiveds#modify"

end
