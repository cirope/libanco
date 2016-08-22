class WorkgroupsController < ApplicationController
  include Authentication
  include Authorization
  include Title

  before_action :set_workgroup, only: [:edit, :update]

  # GET /workgroups
  # GET /workgroups.json
  def index
    @workgroups = Workgroup.page params[:page]
  end

  # GET /workgroups/1
  # GET /workgroups/1.json
  def show
  end

  # GET /workgroups/new
  def new
    @workgroup = Workgroup.new
  end

  # GET /workgroups/1/edit
  def edit
  end

  # POST /workgroups
  # POST /workgroups.json
  def create
    @workgroup = Workgroup.new workgroup_params

    if @workgroup.save
      redirect_to workgroups_url
    else
      render 'new'
    end
  end

  # PATCH/PUT /workgroups/1
  # PATCH/PUT /workgroups/1.json
  def update
    if @workgroup.update workgroup_params
      redirect_to workgroups_url
    else
      render 'edit'
    end
  end

  # DELETE /workgroups/1
  # DELETE /workgroups/1.json
  def destroy
    @workgroup.destroy
    redirect_to workgroups_url
  end

  private

    def set_workgroup
      @workgroup = Workgroup.find params[:id]
    end

    def workgroup_params
      params.require(:workgroup).permit :name, :lock_version
    end
end
