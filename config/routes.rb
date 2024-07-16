Rails.application.routes.draw do
  resources :users
  resource :session, only: %i[new create destroy]
  resources :decks
  resources :cards

  root 'home#index'
end
