class SchedulesController < ApplicationController
  include Authentication
  include Authorization
  include Title

  before_action :set_customer, only: [:new, :create, :edit, :update]
  before_action :set_current_date, only: [:index, :new, :create]
  before_action :set_scheduled_month, only: [:index]
  before_action :set_schedule, only: [:edit, :update, :destroy, :mark_as_done]

  # GET /schedules
  def index
    if params[:date].present?
      @schedules = Schedule.find_by_day(@current_date)
    else
      redirect_to "#{schedules_url}/#{l Date.today, format: :calendar}"
    end
  end

  # GET /schedules/new
  def new
    @schedule = Schedule.new(scheduled_at: @current_date)
    render 'form'
  end

  # GET /schedules/1/edit
  def edit
    render 'form'
  end

  # POST /schedules
  def create
    @schedule = current_user.schedules.new schedule_params.merge(customer: @customer)

    if @schedule.save
      redirect_back fallback_location: schedules_url, turbolinks: true
    else
      render 'action'
    end
  end

  # PATCH/PUT /schedules/1
  def update
    if @schedule.update schedule_params
      redirect_back fallback_location: schedules_url, turbolinks: true
    else
      render 'action'
    end
  end

  # PUT /schedules/1/mark_as_done
  def mark_as_done
    @schedule.mark_as_done!
  end
  authority_actions mark_as_done: 'update'

  private

    def set_schedule
      @schedule = Schedule.find(params[:id])
    end

    def set_current_date
      @current_date =
        Timeliness.parse(params[:date], zone: :local).try(:to_date) || Date.today
    end

    def set_scheduled_month
      @scheduled_month = Schedule.find_by_month(@current_date)
    end

    def set_customer
      @customer = Customer.find(params[:customer_id]) if params[:customer_id].present?
    end

    def schedule_params
      params.require(:schedule).permit :description, :scheduled_at, :remind_me, :lock_version
    end
end
