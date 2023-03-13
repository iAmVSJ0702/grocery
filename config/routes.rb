
Rails.application.routes.draw do
  get 'cart', to: 'cart#show'
  post 'cart/add'
  post 'cart/remove'
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
  root 'items#index'

  resources :sessions , only: [:new , :create , :destroy]
  get "/signin" => "sessions#new" , as: "signin"
  get "/signout" => "sessions#destroy" , as: "signout"
  
  get "/aboutus" => "welcome#index" , as: "about-us"
  get "/item/show" => "items#show" , as: "show"
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
