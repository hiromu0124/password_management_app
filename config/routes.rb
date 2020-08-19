Rails.application.routes.draw do
  devise_for :users, :controllers => {
  :registrations => 'users/registrations',
  :sessions => 'users/sessions'   
} 

devise_scope :user do
  get "user/:id", :to => "users/registrations#detail"
  get "signup", :to => "users/registrations#new"
  get "login", :to => "users/sessions#new"
  get "logout", :to => "users/sessions#destroy"
end
  root "password_forms#new"

  resources :password_forms 
  get "app_url", to:"password_forms#new_url"

  get '*path', to: 'application#render_404'
  post '/callback' => 'linebot#callback'
end
