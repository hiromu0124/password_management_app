Rails.application.routes.draw do
  root "password_forms#new"

  resources :password_forms 
  get "app_url", to:"password_forms#new_url"

  get '*path', to: 'application#render_404'
  post '/callback' => 'linebot#callback'
end
