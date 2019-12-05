Rails.application.routes.draw do
  get 'feedbacks', to: 'feedbacks#new'
  post 'feedbacks', to: 'feedbacks#create'
  get 'shoes', to: 'shoes#index'
  get 'shoes/:id', to: 'shoes#show'
  get 'about', to: 'pages#about'
  devise_for :users
  root to: 'pages#home'
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
