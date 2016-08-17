class HeaderTemplatesController < ApplicationController
  include Authentication
  include Title

  authorize_actions_for HeaderTemplate, except: [:image]
  ensure_authorization_performed except: [:image]

  before_action :set_header_template, only: [:show, :edit, :update, :image]

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
    @header_template = HeaderTemplate.new(
      header_template_params.merge account: current_tenant
    )

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

  def image
    img_url = @header_template.image.logo.url
    send_file File.join(Rails.root, img_url), x_sendfile: true
  end

  private

    def set_header_template
      @header_template = HeaderTemplate.find params[:id]
    end

    def header_template_params
      params.require(:header_template).permit :name, :image, :image_cache, :lock_version
    end
end
