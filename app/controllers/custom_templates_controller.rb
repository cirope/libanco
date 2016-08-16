class CustomTemplatesController < ApplicationController
  include Authentication
  include Authorization
  include Title

  before_action :set_custom_template, only: [:show, :edit, :update, :destroy]

  # GET /custom_templates
  # GET /custom_templates.json
  def index
    @custom_templates = CustomTemplate.page params[:page]
  end

  # GET /custom_templates/1
  # GET /custom_templates/1.json
  def show
  end

  # GET /custom_templates/new
  def new
    @custom_template = CustomTemplate.new
  end

  # GET /custom_templates/1/edit
  def edit
  end

  # POST /custom_templates
  # POST /custom_templates.json
  def create
    @custom_template = CustomTemplate.new custom_template_params

    if @custom_template.save
      redirect_to @custom_template
    else
      render 'new'
    end
  end

  # PATCH/PUT /custom_templates/1
  # PATCH/PUT /custom_templates/1.json
  def update
    if @custom_template.update custom_template_params
      redirect_to @custom_template
    else
      render 'edit'
    end
  end

  # DELETE /custom_templates/1
  # DELETE /custom_templates/1.json
  def destroy
    @custom_template.destroy
    redirect_to custom_templates_url
  end

  private

    def set_custom_template
      @custom_template = CustomTemplate.find params[:id]
    end

    def custom_template_params
      params.require(:custom_template).permit :name, :header_template_id, :footer_template_id, :lock_version,
        custom_body_templates_attributes: [:id, :body_template_id, :_destroy]
    end
end
