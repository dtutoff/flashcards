Rails.application.routes.draw do
  get 'cards/new'
  get 'decks/new'
  get 'decks/create_card'
  resources :users
end
