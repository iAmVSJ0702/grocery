# frozen_string_literal: true

Rails.application.routes.draw do
  resources :brands, only: %i[index show edit update new create destroy] do
    collection do
      get :subcategory
    end
  end
  resources :subcategories, only: %i[new show index edit update create destroy]
  resources :admin, only: %i[index edit update] do
    collection do
      get :fetch_category_subcategories
    end
  end
  resources :categories, only: %i[index show edit update new create destroy]
  resources :users, only: %i[index new edit update show create destroy]
  resources :items, only: %i[index create new show edit update destroy] do
    collection do
      get :fetch_category_subcategories
      get :fetch_subcategory_brands
    end
  end
  resources :orderables
  resources :orders, only: %i[index new create show destroy]
  root 'items#index'
  get 'cart', to: 'cart#show'
  post 'cart/add'
  post 'cart/remove'

  resources :sessions, only: %i[new create destroy]
  get '/signin' => 'sessions#new', as: 'signin'
  get '/signout' => 'sessions#destroy', as: 'signout'

  get '/aboutus' => 'welcome#index', as: 'about-us'
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
