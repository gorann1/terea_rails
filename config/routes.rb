Rails.application.routes.draw do
  get "registrations/new"
  get "registrations/create"
  root to: "pages#home"

  # App Routes
  get "/about" => "about#index"
  get "/static" => "static#index"
  get "/contact" => "contact#index"
  get "/up/", to: "up#index", as: :up
  get "/up/databases", to: "up#databases", as: :up_databases

  # Authentication Routes
  resources :users
  resource :login, controller: :sessions, only: %i[new create destroy]
  resources :passwords, only: %i[new create edit update], param: :token
  get "/login", to: "sessions#new", as: :new_session
  delete "/logout", to: "sessions#destroy", as: :logout
  get "/users" => "users#index"
  get "/signup" => "registrations#new", as: :signup
  post "/signup" => "registrations#create", as: :create_user

  # User profile
  #

  # Admin Routes
  get "/admin", to: "admin#index", as: :admin

  # User Routes
  #

  # User Profile


  # Sidekiq has a web dashboard which you can enable below. It's turned off by
  # default because you very likely wouldn't want this to be available to
  # everyone in production.
  #
  # Uncomment the 2 lines below to enable the dashboard WITHOUT authentication,
  # but be careful because even anonymous web visitors will be able to see it!
  # require "sidekiq/web"
  # mount Sidekiq::Web => "/sidekiq"
  #
  # If you add Devise to this project and happen to have an admin? attribute
  # on your user_page you can uncomment the 4 lines below to only allow access to
  # the dashboard if you're an admin. Feel free to adjust things as needed.
  # require "sidekiq/web"
  # authenticate :user_page, lambda { |u| u.admin? } do
  #   mount Sidekiq::Web => "/sidekiq"
  # end

  # Learn more about this file at: https://guides.rubyonrails.org/routing.html
end
