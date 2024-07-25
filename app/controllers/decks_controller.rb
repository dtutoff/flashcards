class DecksController < ApplicationController
  before_action :set_decks!
  before_action :find_deck!, only: %i[show edit update destroy]

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

  def edit
  end

  def show
  end

  def update
    if @deck.update deck_params
      redirect_to decks_path
    else
      render :edit
    end
  end

  def destroy
    @deck.destroy
    redirect_to decks_path
  end

  private

  def set_decks!
    @decks = current_user.decks
  end

  def deck_params
    params.require(:deck).permit(:name, :id)
  end

  def find_deck!
    @deck = Deck.find(params[:id])
  end
end
