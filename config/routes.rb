Rails.application.routes.draw do
  resources :houses, only: [:index, :show]
  resources :dogs, only: [:index, :show]
  resources :people, only: [:index, :show]
  
  get 'about', to: 'pages#about', as: 'about'

  root to: 'pages#about'

  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
