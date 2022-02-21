Rails.application.routes.draw do
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
get 'unsubscribe/:id' => 'homes#unsubscribe', as: 'confirm_unsubscribe'
patch ':id/withdraw/:id' => 'homes#withdraw', as: 'withdraw_end_user'
put 'withdraw/:id' => 'end_users#withdraw'

scope module: :public do
  post 'orders/confirm' => 'orders#confirm'
  get 'orders/complete' => 'orders#complete'
  resources :end_users, only: [:show, :edit, :update]
  resources :products, only: [:index, :show]
  resources :orders, only: [:index, :show,:new, :create]
  resources :cart_items, only: [:index, :create, :update, :destroy,] do
    delete 'destroy_all'
  end
  resources :deliveries, only: [:index, :edit, :update, :create, :destroy]
end

namespace :admin do
  resources :products, only: [:index, :new, :create, :show, :edit, :update]
  resources :genres, only: [:index, :create, :edit, :update]
  resources :end_users, only: [:index, :show, :edit, :update, :withdraw]
  resources :orders, only: [:index, :show, :update]
  resources :order_details, only: [:update]
end

  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end
