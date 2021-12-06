Rails.application.routes.draw do
  #ANXIETY ROUTES
  get "/anxieties" => "anxieties#index"

  post "/anxieties" => "anxieties#create"

  patch "/anxieties/:id" => "anxieties#update"

  delete "/anxieties/:id" => "anxieties#destroy"

  #USER ROUTES
  post "/users" => "users#create"

  #SESSION ROUTES
  post "/sessions" => "sessions#create"
end
