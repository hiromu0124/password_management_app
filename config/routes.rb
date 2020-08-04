Rails.application.routes.draw do
  root "password_forms#new"
  resources :password_forms
  
end
