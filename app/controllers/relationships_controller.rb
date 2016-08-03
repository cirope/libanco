class RelationshipsController < ApplicationController
  include Authentication
  include Authorization
  include Title

  before_action :set_relationship, only: [:edit, :update]

  # GET /relationships
  # GET /relationships.json
  def index
    @relationships = Relationship.page params[:page]
  end

  # GET /relationships/new
  def new
    @relationship = Relationship.new
  end

  # GET /relationships/1/edit
  def edit
  end

  # POST /relationships
  # POST /relationships.json
  def create
    @relationship = Relationship.new relationship_params

    if @relationship.save
      redirect_to relationships_url
    else
      render 'new'
    end
  end

  # PATCH/PUT /relationships/1
  # PATCH/PUT /relationships/1.json
  def update
    if @relationship.update relationship_params
      redirect_to relationships_url
    else
      render 'edit'
    end
  end

  private

    def set_relationship
      @relationship = Relationship.find params[:id]
    end

    def relationship_params
      params.require(:relationship).permit :name, :lock_version
    end
end
