Rails.application.routes.draw do
  namespace :admin do
    get 'genres/index'
    get 'genres/new'
    get 'genres/edit'
  end
# 顧客用
# URL /customers/sign_in ...
devise_for :end_users, controllers: {
  registrations: "public/registrations",
  sessions: 'public/sessions'
}

# 管理者用
# URL /admin/sign_in ...
devise_for :admin, skip: [:registrations, :passwords], controllers: {
  sessions: "admin/sessions"
}

root :to => 'homes#top'
get "homes/about" => "homes#about"


resource :end_users, only: [:show, :unsubscribe, :withdraw, :edit, :update]
resources :products, only: [:index, :show]
resources :orders, only: [:index, :show, :comfirm, :complete, :new, :create]
resources :cart_items, only: [:index, :create, :update, :destroy, :destroy_all]
resources :deliveries, only: [:index, :edit, :update, :create, :destroy]

namespace :admin do
  resources :products, only: [:index, :new, :create, :show, :edit, :update]
  resources :genres, only: [:index, :create, :edit, :update]
  resources :end_users, only: [:index, :show, :edit, :update, :withdraw]
  resources :orders, only: [:index, :show, :update]
  resources :order_details, only: [:update]
end

  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end
