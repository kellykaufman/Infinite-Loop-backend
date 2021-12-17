Rails.application.routes.draw do
  #ANXIETY ROUTES
  get "/anxieties" => "anxieties#index"

  get "/anxieties/:id" => "anxieties#show"

  post "/anxieties" => "anxieties#create"

  patch "/anxieties/:id" => "anxieties#update"

  delete "/anxieties/:id" => "anxieties#destroy"

  #USER ROUTES
  post "/users" => "users#create"

  patch "/users/:id" => "users#update"

  delete "/users/:id" => "users#destroy"

  #SESSION ROUTES
  post "/sessions" => "sessions#create"
end
