Rails.application.routes.draw do
  post 'user_token' => 'user_token#create'
  # STEP 1: A ROUTE triggers a controller action
  # verb "/urls" => "namespace/controllers#action"
  namespace :api do
    get "/products" => "products#index"
    get "/products/:id" => "products#show"
    #get "/products/:id" => "products#choice"
    post "/products" => "products#create"
    patch "/products/:id" => "products#update"
    delete "/products/:id" => "products#destroy"

    get "/orders/:id" => "orders#show"
    post "/orders" => "orders#create"

    get "/images/:id" => "images#show"
    post "/images" => "images#create"

    get "carted_products" => "carted_products#index"
    get "carted_products/:id" => "carted_products#show"
    post "carted_products" => "carted_products#create"
    delete "carted_products/:id" => "carted_products#destroy"

  end

    post "/users" => "users#create"
end
