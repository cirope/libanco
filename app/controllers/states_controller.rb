class StatesController < ApplicationController
  include Authentication
  include Authorization
  include Title

  before_action :set_state, only: [:edit, :update]

  # GET /states
  # GET /states.json
  def index
    @states = State.page params[:page]
  end

  # GET /states/new
  def new
    @state = State.new
  end

  # GET /states/1/edit
  def edit
  end

  # POST /states
  # POST /states.json
  def create
    @state = State.new state_params

    if @state.save
      redirect_to states_url
    else
      render 'new'
    end
  end

  # PATCH/PUT /states/1
  # PATCH/PUT /states/1.json
  def update
    if @state.update state_params
      redirect_to states_url
    else
      render 'edit'
    end
  end

  private

    def set_state
      @state = State.find params[:id]
    end

    def state_params
      params.require(:state).permit :name, :lock_version
    end
end
