class CustomersController < ApplicationController
  include Authentication
  include Authorization
  include Title

  before_action :set_customer, only: [:show, :edit, :update, :destroy]
  before_action :set_search_path, only: [:index, :show, :new, :edit]

  # GET /customers
  # GET /customers.json
  def index
    @customers = params[:q].present? ? Customer.search(params[:q]) : Customer.all
    @customers = @customers.includes(:card, :nacionality).ordered.
      page(params[:page]).references(:card, :nacionality)
  end

  # GET /customers/1
  # GET /customers/1.json
  def show
  end

  # GET /customers/new
  def new
    @customer = Customer.new
  end

  # GET /customers/1/edit
  def edit
  end

  # POST /customers
  # POST /customers.json
  def create
    @customer = Customer.new customer_params

    if @customer.save
      redirect_to @customer
    else
      render 'new'
    end
  end

  # PATCH/PUT /customers/1
  # PATCH/PUT /customers/1.json
  def update
    if @customer.update customer_params
      redirect_to @customer
    else
      render 'edit'
    end
  end

  private

    def set_customer
      @customer = Customer.find params[:id]
    end

    def set_search_path
      @search_path = customers_url
    end

    def customer_params
      params.require(:customer).permit :name, :lastname, :identification, :identification_type,
        :address, :work_address, :monthly_income, :email, :phone, :cellphone, :member, :workgroup_id,
        :birthdate, :occupation_id, :neighborhood_id, :state_id, :city_id, :card_id,
        :place_birth, :nacionality_id, :marital_status_id, :education_level_id, :adviser_id,
        references_attributes: [
          :id, :name, :lastname, :identification_type, :identification, :phone, :relationship_id, :_destroy
        ]
    end
end
