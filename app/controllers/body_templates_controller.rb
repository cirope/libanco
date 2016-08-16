class BodyTemplatesController < ApplicationController
  include Authentication
  include Authorization
  include Title

  before_action :set_body_template, only: [:show, :edit, :update, :destroy]

  # GET /body_templates
  # GET /body_templates.json
  def index
    @body_templates = BodyTemplate.page params[:page]
  end

  # GET /body_templates/1
  # GET /body_templates/1.json
  def show
  end

  # GET /body_templates/new
  def new
    @body_template = BodyTemplate.new
  end

  # GET /body_templates/1/edit
  def edit
  end

  # POST /body_templates
  # POST /body_templates.json
  def create
    @body_template = BodyTemplate.new body_template_params

    if @body_template.save
      redirect_to @body_template
    else
      render 'new'
    end
  end

  # PATCH/PUT /body_templates/1
  # PATCH/PUT /body_templates/1.json
  def update
    if @body_template.update body_template_params
      redirect_to @body_template
    else
      render 'edit'
    end
  end

  private

    def set_body_template
      @body_template = BodyTemplate.find params[:id]
    end

    def body_template_params
      params.require(:body_template).permit :name, :content, :lock_version
    end
end
