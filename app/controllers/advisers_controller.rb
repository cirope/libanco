class AdvisersController < ApplicationController
  include Authentication
  include Authorization
  include Title

  before_action :set_adviser, only: [:show, :edit, :update]

  # GET /advisers
  # GET /advisers.json
  def index
    @advisers = Adviser.page params[:page]
  end

  # GET /advisers/1
  # GET /advisers/1.json
  def show
  end

  # GET /advisers/new
  def new
    @adviser = Adviser.new
  end

  # GET /advisers/1/edit
  def edit
  end

  # POST /advisers
  # POST /advisers.json
  def create
    @adviser = Adviser.new adviser_params

    if @adviser.save
      redirect_to @adviser
    else
      render 'new'
    end
  end

  # PATCH/PUT /advisers/1
  # PATCH/PUT /advisers/1.json
  def update
    if @adviser.update adviser_params
      redirect_to @adviser
    else
      render 'edit'
    end
  end

  private

    def set_adviser
      @adviser = Adviser.find params[:id]
    end

    def adviser_params
      params.require(:adviser).permit :name, :lastname, :identification_type, :identification,
        :phone, :lock_version
    end
end
