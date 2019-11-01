Rails.application.routes.draw do
  get 'pages/contact', as: 'contact'
  get 'shoes', to: 'shoes#index'
  get 'shoes/:id', to: 'shoes#show'
  devise_for :users
  root to: 'pages#home'
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
