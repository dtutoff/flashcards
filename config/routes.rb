Rails.application.routes.draw do
  resources :users
  resource :session, only: %i[new create destroy]

  root 'home#index'
end
