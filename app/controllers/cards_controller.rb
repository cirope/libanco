class CardsController < ApplicationController
  include Authentication
  include Authorization
  include Title

  before_action :set_card, only: [:edit, :update]

  # GET /cards
  # GET /cards.json
  def index
    @cards = Card.page params[:page]
  end

  # GET /cards/new
  def new
    @card = Card.new
  end

  # GET /cards/1/edit
  def edit
  end

  # POST /cards
  # POST /cards.json
  def create
    @card = Card.new card_params

    if @card.save
      redirect_to cards_url
    else
      render 'new'
    end
  end

  # PATCH/PUT /cards/1
  # PATCH/PUT /cards/1.json
  def update
    if @card.update card_params
      redirect_to cards_url
    else
      render 'edit'
    end
  end

  private

    def set_card
      @card = Card.find params[:id]
    end

    def card_params
      params.require(:card).permit :name, :admission_fee, :monthly_fee, :active, :lock_version
    end
end
