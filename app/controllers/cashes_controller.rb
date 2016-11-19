class CashesController < ApplicationController
  include Authentication
  include Authorization
  include Title

  before_action :set_cash, only: [:show, :edit, :update, :destroy]
  before_action :verify_cash_status, only: [:new, :create]

  # GET /cashes
  # GET /cashes.json
  def index
    @cashes = Cash.all
  end

  # GET /cashes/1
  # GET /cashes/1.json
  def show
  end

  # GET /cashes/new
  def new
    @cash = Cash.new
  end

  # GET /cashes/1/edit
  def edit
  end

  # POST /cashes
  # POST /cashes.json
  def create
    @cash = Cash.new cash_params.merge(user: current_user)

    if @cash.save
      redirect_to cash_flows_url(@cash)
    else
      render 'new'
    end
  end

  # PATCH/PUT /cashes/1
  # PATCH/PUT /cashes/1.json
  def update
    respond_to do |format|
      if @cash.update(cash_params)
        format.html { redirect_to @cash, notice: 'Cash was successfully updated.' }
        format.json { render :show, status: :ok, location: @cash }
      else
        format.html { render :edit }
        format.json { render json: @cash.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /cashes/1
  # DELETE /cashes/1.json
  def destroy
    @cash.destroy
    respond_to do |format|
      format.html { redirect_to cashes_url, notice: 'Cash was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private

    def set_cash
      @cash = Cash.find params[:id]
    end

    def verify_cash_status
      if @cash = Cash.current_cash
        redirect_to cash_flows_path(@cash)
      end
    end

    def cash_params
      params.require(:cash).permit :opened_at, :opening_balance, :lock_version
    end
end
