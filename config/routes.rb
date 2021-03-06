Rails.application.routes.draw do
  devise_for :users, except: [:index]
  resources :admin
  resources :newsletters
  resources :t_materials
  resources :newsfeeds
  resources :categories
  resources :refmaterials
  resources :refvideos
  resources :contract_packages

  put 'approve_admin', to: "admin#approve", as: :approve_admin

  put 'unapprove_admin', to: "admin#unapprove", as: :unapprove_admin

  put 'delete_user', to: 'admin#delete_user', as: :delete_user

  get 'contact', to: 'messages#new', as: 'contact'

  post 'contact', to: 'messages#create'

  get 'home/index'

  get 'home/about'

  get 'home/carriers'

  get 'home/associations'

  get 'home/life'

  get 'home/medical'

  get 'home/agents'

  get 'home/contact'

  get 'users/index'

  root 'home#index'

  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
