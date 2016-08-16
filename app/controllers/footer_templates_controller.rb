class FooterTemplatesController < ApplicationController
  include Authentication
  include Authorization
  include Title

  before_action :set_footer_template, only: [:show, :edit, :update]

  # GET /footer_templates
  # GET /footer_templates.json
  def index
    @footer_templates = FooterTemplate.page params[:page]
  end

  # GET /footer_templates/1
  # GET /footer_templates/1.json
  def show
  end

  # GET /footer_templates/new
  def new
    @footer_template = FooterTemplate.new
  end

  # GET /footer_templates/1/edit
  def edit
  end

  # POST /footer_templates
  # POST /footer_templates.json
  def create
    @footer_template = FooterTemplate.new footer_template_params

    if @footer_template.save
      redirect_to @footer_template
    else
      render 'new'
    end
  end

  # PATCH/PUT /footer_templates/1
  # PATCH/PUT /footer_templates/1.json
  def update
    if @footer_template.update footer_template_params
      redirect_to @footer_template
    else
      render 'edit'
    end
  end

  private

    def set_footer_template
      @footer_template = FooterTemplate.find params[:id]
    end

    def footer_template_params
      params.require(:footer_template).permit :name, :content , :lock_version
    end
end
