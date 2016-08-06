class CreditLinesController < ApplicationController
  include Authentication
  include Authorization
  include Title

  before_action :set_credit_line, only: [:edit, :update]

  # GET /credit_lines
  # GET /credit_lines.json
  def index
    @credit_lines = CreditLine.page params[:page]
  end

  # GET /credit_lines/new
  def new
    @credit_line = CreditLine.new
  end

  # GET /credit_lines/1/edit
  def edit
  end

  # POST /credit_lines
  # POST /credit_lines.json
  def create
    @credit_line = CreditLine.new credit_line_params

    if @credit_line.save
      redirect_to credit_lines_url
    else
      render 'new'
    end
  end

  # PATCH/PUT /credit_lines/1
  # PATCH/PUT /credit_lines/1.json
  def update
    if @credit_line.update credit_line_params
      redirect_to credit_lines_url
    else
      render 'edit'
    end
  end

  private

    def set_credit_line
      @credit_line = CreditLine.find params[:id]
    end

    def credit_line_params
      params.require(:credit_line).permit :name, :commission, :interest, :tax,
        :tax_perception, :gross_income_perception, :insurance, :stamped, :lock_version
    end
end
