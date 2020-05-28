Rails.application.routes.draw do
  # EXAMPLE HTML ROUTE
  # get "/photos" => "photos#index"

  # EXAMPLE JSON ROUTE WITH API NAMESPACE
  namespace :api do
    get "/products" => "products#display"
    get "/one_product" => "products#one_product"
    get "/any_product/:id" => "products#any_product"
    get "/any_product" => "products#any_product"
    
  end
end
