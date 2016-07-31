class CitiesController < ApplicationController
  include Authentication
  include Authorization
  include Title

  before_action :set_city, only: [:edit, :update]

  # GET /cities
  # GET /cities.json
  def index
    @cities = City.page params[:page]
  end

  # GET /cities/new
  def new
    @city = City.new
  end

  # GET /cities/1/edit
  def edit
  end

  # POST /cities
  # POST /cities.json
  def create
    @city = City.new city_params

    if @city.save
      redirect_to cities_url
    else
      render 'new'
    end
  end

  # PATCH/PUT /cities/1
  # PATCH/PUT /cities/1.json
  def update
    if @city.update city_params
      redirect_to cities_url
    else
      render 'edit'
    end
  end

  private

    def set_city
      @city = City.find(params[:id])
    end

    def city_params
      params.require(:city).permit :name, :state_id, :lock_version
    end
end
