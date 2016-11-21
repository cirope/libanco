class InvestmentGroupsController < ApplicationController
  include Authentication
  include Authorization
  include Title

  before_action :set_investment_group, only: [:edit, :update]

  # GET /investment_groups
  # GET /investment_groups.json
  def index
    @investment_groups = InvestmentGroup.page params[:page]
  end

  # GET /investment_groups/new
  def new
    @investment_group = InvestmentGroup.new
  end

  # GET /investment_groups/1/edit
  def edit
  end

  # POST /investment_groups
  # POST /investment_groups.json
  def create
    @investment_group = InvestmentGroup.new investment_group_params

    if @investment_group.save
      redirect_to investment_groups_url
    else
      render 'new'
    end
  end

  # PATCH/PUT /investment_groups/1
  # PATCH/PUT /investment_groups/1.json
  def update
    if @investment_group.update investment_group_params
      redirect_to investment_groups_url
    else
      render 'edit'
    end
  end

  private

    def set_investment_group
      @investment_group = InvestmentGroup.find params[:id]
    end

    def investment_group_params
      params.require(:investment_group).permit :name, :lock_version
    end
end
