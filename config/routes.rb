Rails.application.routes.draw do
  # STEP 1: A ROUTE triggers a controller action
  # verb "/urls" => "namespace/controllers#action"
  get "/" => "client/products#index"
  namespace :client do
    get "/products" => "products#index"
    get "/products/new" => "products#new"
    get "/products/:id" => "products#show"
    post "/products/" => "products#create"
    get "/products/:id/edit" => "products#edit"
    patch "/products/:id" => "products#update"
    delete "/products/:id" => "products#destroy"
    
    get "/signup" => "users#new"
    post "/users" => "users#create"
    get "/login" => "sessions#new"
    post "/login" => "sessions#create"
    delete "/logout" => "sessions#destroy"
  end
end
