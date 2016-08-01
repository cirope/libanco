class NeighborhoodsController < ApplicationController
  include Authentication
  include Authorization
  include Title

  before_action :set_neighborhood, only: [:edit, :update]

  # GET /neighborhoods
  # GET /neighborhoods.json
  def index
    @neighborhoods = Neighborhood.page params[:page]
  end

  # GET /neighborhoods/new
  def new
    @neighborhood = Neighborhood.new
  end

  # GET /neighborhoods/1/edit
  def edit
  end

  # POST /neighborhoods
  # POST /neighborhoods.json
  def create
    @neighborhood = Neighborhood.new neighborhood_params

    if @neighborhood.save
      redirect_to neighborhoods_url
    else
      render 'new'
    end
  end

  # PATCH/PUT /neighborhoods/1
  # PATCH/PUT /neighborhoods/1.json
  def update
    if @neighborhood.update neighborhood_params
      redirect_to neighborhoods_url
    else
      render 'edit'
    end
  end

  private

    def set_neighborhood
      @neighborhood = Neighborhood.find params[:id]
    end

    def neighborhood_params
      params.require(:neighborhood).permit :name, :lock_version
    end
end
