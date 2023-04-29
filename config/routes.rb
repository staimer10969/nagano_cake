Rails.application.routes.draw do

  devise_for :admin, skip: [:registrations, :passwords], controllers: {
  sessions: "admin/sessions"
}
  get "admin" => "homes#top", as:'admin'
  namespace :admin do
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
   get "customers/infomation" => "customers#show"
   resources :items, only: [:index, :show]
   resources :cart_items, only: [:index, :update, :create, :destroy]
   resources :orders, only: [:new, :create, :index, :show]
  end
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end
