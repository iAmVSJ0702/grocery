
Rails.application.routes.draw do

  resources :brands , only: [:index , :edit, :update ,:new ,:create , :destroy] do
    collection do
      get :subcategory
    end
  end
  resources :subcategories, only: [:new ,:index,:edit,:update,:create , :destroy]
  resources :admin , only: [:index , :edit ,:update] do
    collection do
      get :fetch_category_subcategories
    end
  end
  resources :categories , only: [:new,:create,:edit,:update,:destroy]
  resources :users
  resources :items do
    collection do
      get :fetch_category_subcategories
      get :fetch_subcategory_brands
    end
  end
  resources :carts
  root 'items#index'

  resources :sessions , only: [:new , :create , :destroy]
  get "/login" => "sessions#new" , as: "login"
  get "/logout" => "sessions#destroy" , as: "logout"

  get "/item/show" => "items#show" , as: "show"
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
