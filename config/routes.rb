Rails.application.routes.draw do
  devise_for :users
  resources :admin
  resources :newsletters

  put 'approve_admin', to: "admin#approve", as: :approve_admin

  put 'unapprove_admin', to: "admin#unapprove", as: :unapprove_admin

  get 'home/index'

  get 'home/about'

  get 'home/products'

  get 'home/agents'

  get 'home/contact'

  root 'home#index'

  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
