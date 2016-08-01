class OccupationsController < ApplicationController
  include Authentication
  include Authorization
  include Title

  before_action :set_occupation, only: [:edit, :update]

  # GET /occupations
  # GET /occupations.json
  def index
    @occupations = Occupation.page params[:page]
  end

  # GET /occupations/new
  def new
    @occupation = Occupation.new
  end

  # GET /occupations/1/edit
  def edit
  end

  # POST /occupations
  # POST /occupations.json
  def create
    @occupation = Occupation.new occupation_params

    if @occupation.save
      redirect_to occupations_url
    else
      render 'new'
    end
  end

  # PATCH/PUT /occupations/1
  # PATCH/PUT /occupations/1.json
  def update
    if @occupation.update occupation_params
      redirect_to occupations_url
    else
      render 'edit'
    end
  end

  private

    def set_occupation
      @occupation = Occupation.find params[:id]
    end

    def occupation_params
      params.require(:occupation).permit :name , :lock_version
    end
end
