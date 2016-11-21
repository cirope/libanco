class InvestorsController < ApplicationController
  include Authentication
  include Authorization
  include Title

  before_action :set_investor, only: [:show, :edit, :update, :destroy]
  before_action :set_search_path, only: [:index, :show, :new, :edit]

  # GET /investors
  # GET /investors.json
  def index
    @investors = params[:q].present? ? Investor.search(params[:q]) : Investor.all
    @investors = @investors.includes(:investment_group, :consultant).ordered.
      page(params[:page]).references(:investment_group, :consultant)
  end

  # GET /investors/1
  # GET /investors/1.json
  def show
  end

  # GET /investors/new
  def new
    @investor = Investor.new
  end

  # GET /investors/1/edit
  def edit
  end

  # POST /investors
  # POST /investors.json
  def create
    @investor = Investor.new investor_params.merge(user: current_user)

    if @investor.save
      redirect_to @investor
    else
      render 'new'
    end
  end

  # PATCH/PUT /investors/1
  # PATCH/PUT /investors/1.json
  def update
    if @investor.update investor_params
      redirect_to @investor
    else
      render 'edit'
    end
  end

  # DELETE /investors/1
  # DELETE /investors/1.json
  def destroy
    @investor.destroy
    redirect_to investors_url
  end

  private

    def set_investor
      @investor = Investor.find params[:id]
    end

    def set_search_path
      @search_path = investors_url
    end

    def investor_params
      params.require(:investor).permit :name, :lastname, :identification_type, :identification,
        :phone, :cellphone, :address, :city_id, :state_id, :investment_group_id, :consultant_id,
        :lock_version
    end
end
