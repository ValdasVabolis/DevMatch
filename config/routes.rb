Rails.application.routes.draw do
  # home page points to pages controller, home action
  root to: 'pages#home'
  # on get request, go to pages controller and run about action
  get 'about', to: 'pages#about'
  resources :contacts
end
