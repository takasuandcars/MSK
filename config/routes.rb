Rails.application.routes.draw do

   # root "sessions#new"
    
    post 'direct_messages', to: "direct_messages#create"
    resources :rooms
    resources :entries
    get 'events/work_hours', to: "events#work_hours"
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

    #routes for react

    root to: redirect('/home')
    get '/home', to: "site#index"
    get '/login_react', to: "site#index"
    get '/dashboard', to: "site#index"


    #copy from the site
    post '/signup', to: 'registrations#signup'
    post '/signup2', to: 'registrations#login'

  
    #post '/login', to: 'sessions#login'
    delete '/logout', to: 'sessions#logout'
    get '/login_check', to: 'site#logged_in?'
    #end of copy
    namespace :api do
      namespace :v1 do
        get '/site/index', to: 'site#index'
        get '/auth', to: 'sessions#login'
        #resources :todos, only: %i[index show create update destroy]
      end
    end

end
