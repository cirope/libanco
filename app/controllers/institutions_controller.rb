class InstitutionsController < ApplicationController
  include Authentication
  include Authorization
  include Title

  before_action :set_institution, only: [:edit, :update]

  # GET /institutions
  # GET /institutions.json
  def index
    @institutions = Institution.page params[:page]
  end

  # GET /institutions/new
  def new
    @institution = Institution.new
  end

  # GET /institutions/1/edit
  def edit
  end

  # POST /institutions
  # POST /institutions.json
  def create
    @institution = Institution.new institution_params

    if @institution.save
      redirect_to institutions_url
    else
      render 'new'
    end
  end

  # PATCH/PUT /institutions/1
  # PATCH/PUT /institutions/1.json
  def update
    if @institution.update institution_params
      redirect_to institutions_url
    else
      render 'edit'
    end
  end

  private

    def set_institution
      @institution = Institution.find params[:id]
    end

    def institution_params
      params.require(:institution).permit :name, :lock_version
    end
end
