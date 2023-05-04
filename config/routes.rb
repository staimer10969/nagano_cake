Rails.application.routes.draw do

  devise_for :admin, skip: [:registrations, :passwords], controllers: {
  sessions: "admin/sessions"
}

  namespace :admin do
   get "/" => "homes#top"
   resources :items, only: [:index, :new, :create, :show, :edit, :update]
   resources :customers, only: [:index, :show, :edit, :update]
   resources :orders, only: [:show]
  end

  devise_for :customers, skip: [:passwords], controllers: {
  registrations: "public/registrations",
  sessions: 'public/sessions'
}
  scope module: :public do
   root to: 'homes#top'
   get "about" => "homes#about", as:'about'
   get "customers/information" => "customers#show"
   get "customers/information/edit" => "customers#edit"
   patch "customers/information" => "customers#update"
   get "customers/confirm_withdraw" => "customers#confirm_withdraw"
   patch "customers/withdraw" => "customers#withdraw"
   delete "cart_items/destroy_all" => "cart_items#destroy_all"
   post "orders/confirm" => "orders#confirm"
   get "orders/complete" => "orders#complete"
   resources :items, only: [:index, :show]
   resources :cart_items, only: [:index, :update, :create, :destroy]
   resources :orders, only: [:new, :create, :index, :show]
  end
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end
