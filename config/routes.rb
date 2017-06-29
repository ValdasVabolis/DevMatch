Rails.application.routes.draw do
  devise_for :users
  # home page points to pages controller, home action
  root to: 'pages#home'
  # on get request, go to pages controller and run about action
  get 'about', to: 'pages#about'
  # allow only create action from contacts routes
  resources :contacts, only: :create
  # on get request, go to contacts_controller and run new action
  get 'contact-us', to: 'contacts#new'
end
