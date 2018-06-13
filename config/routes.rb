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
  end

    post "/users" => "users#create"
end
