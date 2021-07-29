Rails.application.routes.draw do
    get 'login', to: "sessions#new"
    post 'login', to: "sessions#create"
    delete 'logout', to: "sessions#destroy"
    resources :work_schedules
    get 'works/edit', to: "works#edit"
    patch 'works', to: "works#update"
    get 'works', to: "works#index"
    get 'works/data', to: "works#data"
    get '/qrcode', to: "qrcode#index"
    get 'cameras/index', to: "cameras#index"
    get 'staffs/index'
    resources :users
    get 'events/index', to: "events#index"
    get 'events/pickup', to: "events#pickup"
    get 'events/received', to: "events#received"
    
    get 'record_pdfs/index'
    root "static_pages#index"
    get 'receiveds', to: "receiveds#index"
    get 'receiveds/index_box', to: "receiveds#index_box_in"
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
    resources :pickup_requests, only: [:create, :update, :destroy]
    resources :receiveds, only: [:create, :update, :destroy]
    post "receiveds/update", to: "receiveds#update"
    get "/receiveds/show", to: "receiveds#show"
    get "/receveds/modify", to: "receiveds#modify"
    get "/pdf", to: "record_pdfs#index"
    get "/pickup_requests/index", to: "pickup_requests#index"
    get "pickup_requests/edit", to: "pickup_requests#edit"
    post "pickup_requests/create_received", to: "pickup_requests#create_received"

end
