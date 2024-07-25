Rails.application.routes.draw do
  resources :users
  resource :session, only: %i[new create destroy]
  resources :decks do
    resources :cards
  end


  get 'info', to: 'home#info'

  root 'home#index'
end
