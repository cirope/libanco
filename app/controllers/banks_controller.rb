class BanksController < ApplicationController
  include Authentication
  include Authorization
  include Title

  before_action :set_bank, only: [:edit, :update]

  # GET /banks
  # GET /banks.json
  def index
    @banks = Bank.page params[:page]
  end

  # GET /banks/new
  def new
    @bank = Bank.new
  end

  # GET /banks/1/edit
  def edit
  end

  # POST /banks
  # POST /banks.json
  def create
    @bank = Bank.new bank_params

    if @bank.save
      redirect_to banks_url
    else
      render 'new'
    end
  end

  # PATCH/PUT /banks/1
  # PATCH/PUT /banks/1.json
  def update
    if @bank.update bank_params
      redirect_to banks_url
    else
      render 'edit'
    end
  end

  # DELETE /banks/1
  # DELETE /banks/1.json
  def destroy
    @bank.destroy
    redirect_to banks_url
  end

  private

    def set_bank
      @bank = Bank.find params[:id]
    end

    def bank_params
      params.require(:bank).permit :name, :lock_version
    end
end
