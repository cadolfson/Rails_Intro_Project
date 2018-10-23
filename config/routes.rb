Rails.application.routes.draw do
  
  get 'pages/about', to: 'pages#about'
  get 'about', to: 'pages#about', as: 'about'

  get 'dogs/index'
  get 'dogs/show'
  get 'houses/index'
  get 'houses/show'
  get 'families/index'
  get 'families/show'
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
