class CardsController < ApplicationController
  before_action :find_card!, only: %i[edit update destroy]
  before_action :find_deck!

  def new
    @card = Card.new
  end

  def create
    @card = @deck.cards.create cards_params
    if @card.save
      redirect_to deck_path(@deck)
    else
      render :new
    end
  end

  def destroy
    @card.destroy
    redirect_to deck_path(@deck)
  end

  def update
    if @card.update cards_params
      redirect_to deck_path(@deck)
    else
      render :edit
    end
  end

  def edit
  end

  def show
  end

  private

  def cards_params
    params.require(:card).permit(:front_side, :back_side)
  end

  def find_deck!
    @deck = Deck.find(params[:deck_id])
  end

  def find_card!
    find_deck!
    @card = @deck.cards.find(params[:id])
  end
end
