class HeaderTemplatesController < ApplicationController
  include Authentication
  include Authorization
  include Title

  before_action :set_header_template, only: [:show, :edit, :update]

  # GET /header_templates
  # GET /header_templates.json
  def index
    @header_templates = HeaderTemplate.page params[:page]
  end

  # GET /header_templates/1
  # GET /header_templates/1.json
  def show
  end

  # GET /header_templates/new
  def new
    @header_template = HeaderTemplate.new
  end

  # GET /header_templates/1/edit
  def edit
  end

  # POST /header_templates
  # POST /header_templates.json
  def create
    @header_template = HeaderTemplate.new header_template_params

    if @header_template.save
      redirect_to @header_template
    else
      render 'new'
    end
  end

  # PATCH/PUT /header_templates/1
  # PATCH/PUT /header_templates/1.json
  def update
    if @header_template.update header_template_params
      redirect_to @header_template
    else
      render 'edit'
    end
  end

  private

    def set_header_template
      @header_template = HeaderTemplate.find params[:id]
    end

    def header_template_params
      params.require(:header_template).permit :name, :content, :image, :lock_version
    end
end
