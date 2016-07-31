class MaritalStatusesController < ApplicationController
  include Authentication
  include Authorization
  include Title

  before_action :set_marital_status, only: [:edit, :update]

  # GET /marital_statuses
  # GET /marital_statuses.json
  def index
    @marital_statuses = MaritalStatus.page params[:page]
  end

  # GET /marital_statuses/new
  def new
    @marital_status = MaritalStatus.new
  end

  # GET /marital_statuses/1/edit
  def edit
  end

  # POST /marital_statuses
  # POST /marital_statuses.json
  def create
    @marital_status = MaritalStatus.new marital_status_params

    if @marital_status.save
      redirect_to marital_statuses_url
    else
      render 'new'
    end
  end

  # PATCH/PUT /marital_statuses/1
  # PATCH/PUT /marital_statuses/1.json
  def update
    if @marital_status.update marital_status_params
      redirect_to marital_statuses_url
    else
      render 'edit'
    end
  end

  private

    def set_marital_status
      @marital_status = MaritalStatus.find params[:id]
    end

    def marital_status_params
      params.require(:marital_status).permit :name, :lock_version
    end
end
