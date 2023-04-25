Rails.application.routes.draw do
 
  devise_for :admin, skip: [:registrations, :passwords], controllers: {
  sessions: "admin/sessions"
}
 resources :admin, only: [:top, :new, :show, :edit, :create, :update, :destroy]

  devise_for :customers, skip: [:passwords], controllers: {
  registrations: "public/registrations",
  sessions: 'public/sessions'
}
 resources :public, only: [:new, :index, :show, :edit, :create, :update, :destroy]

  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end
