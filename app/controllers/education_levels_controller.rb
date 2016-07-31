class EducationLevelsController < ApplicationController
  include Authentication
  include Authorization
  include Title

  before_action :set_education_level, only: [:edit, :update]

  # GET /education_levels
  # GET /education_levels.json
  def index
    @education_levels = EducationLevel.page params[:page]
  end

  # GET /education_levels/new
  def new
    @education_level = EducationLevel.new
  end

  # GET /education_levels/1/edit
  def edit
  end

  # POST /education_levels
  # POST /education_levels.json
  def create
    @education_level = EducationLevel.new education_level_params

    if @education_level.save
      redirect_to education_levels_url
    else
      render 'new'
    end
  end

  # PATCH/PUT /education_levels/1
  # PATCH/PUT /education_levels/1.json
  def update
    if @education_level.update education_level_params
      redirect_to education_levels_url
    else
      render 'edit'
    end
  end

  private

    def set_education_level
      @education_level = EducationLevel.find params[:id]
    end

    def education_level_params
      params.require(:education_level).permit :name, :lock_version
    end
end
