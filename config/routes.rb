Rails.application.routes.draw do
  root "articles#index"
  # POST "/sales?method=calcCost"
  post "sales/calcCost" => "sales#calcCost"

  resources :recipes, :recipedetails, :purchases, :sales
  resources :articles do
    resources :sale_packages
  end
  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html

  # Defines the root path route ("/")
  # root "articles#index"
end
