class CardsController < ApplicationController
  before_action :find_deck! , only: %i[new create destroy]

  def new
    @card = Card.new
  end

  def create
    @card = @deck.cards.create cards_params
    if @card.save
      redirect_to decks_path
    else
      render :new
    end
  end

  def destroy
  end

  private

  def cards_params
    params.require(:card).permit(:front_side, :back_side)
  end

  def find_deck!
    @deck = Deck.find(params[:deck_id])
  end

end
