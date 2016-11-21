class ConsultantsController < ApplicationController
  include Authentication
  include Authorization
  include Title

  before_action :set_consultant, only: [:edit, :update]

  # GET /consultants
  # GET /consultants.json
  def index
    @consultants = Consultant.page params[:page]
  end

  # GET /consultants/new
  def new
    @consultant = Consultant.new
  end

  # GET /consultants/1/edit
  def edit
  end

  # POST /consultants
  # POST /consultants.json
  def create
    @consultant = Consultant.new consultant_params

    if @consultant.save
      redirect_to consultants_url
    else
      render 'new'
    end
  end

  # PATCH/PUT /consultants/1
  # PATCH/PUT /consultants/1.json
  def update
    if @consultant.update consultant_params
      redirect_to consultants_url
    else
      render 'edit'
    end
  end

  private

    def set_consultant
      @consultant = Consultant.find params[:id]
    end

    def consultant_params
      params.require(:consultant).permit :name, :lock_version
    end
end
