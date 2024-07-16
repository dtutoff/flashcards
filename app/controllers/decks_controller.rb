class DecksController < ApplicationController
  before_action :set_decks!

  def new
    @deck = Deck.new
  end

  def create
    @deck = current_user.decks.create deck_params
    if @deck.save
      redirect_to decks_path
    else
      render :new
    end
  end

  private

  def set_decks!
    @decks = current_user.decks
  end

  def deck_params
    params.require(:deck).permit(:name)
  end
end
