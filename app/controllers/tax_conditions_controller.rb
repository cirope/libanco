class TaxConditionsController < ApplicationController
  include Authentication
  include Authorization
  include Title

  before_action :set_tax_condition, only: [:edit, :update]

  # GET /tax_conditions
  # GET /tax_conditions.json
  def index
    @tax_conditions = TaxCondition.page params[:page]
  end

  # GET /tax_conditions/new
  def new
    @tax_condition = TaxCondition.new
  end

  # GET /tax_conditions/1/edit
  def edit
  end

  # POST /tax_conditions
  # POST /tax_conditions.json
  def create
    @tax_condition = TaxCondition.new tax_condition_params

    if @tax_condition.save
      redirect_to tax_conditions_url
    else
      render 'new'
    end
  end

  # PATCH/PUT /tax_conditions/1
  # PATCH/PUT /tax_conditions/1.json
  def update
    if @tax_condition.update tax_condition_params
      redirect_to tax_conditions_url
    else
      render 'edit'
    end
  end

  private

    def set_tax_condition
      @tax_condition = TaxCondition.find params[:id]
    end

    def tax_condition_params
      params.require(:tax_condition).permit :name, :lock_version
    end
end
