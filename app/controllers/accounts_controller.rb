class AccountsController < ApplicationController
  include Authentication
  include Authorization
  include Title

  before_action :set_account, only: [:show, :edit, :update, :destroy]

  # GET /accounts
  # GET /accounts.json
  def index
    @accounts = Account.all
  end

  # GET /accounts/new
  def new
    @account = Account.new
  end

  # GET /accounts/1/edit
  def edit
  end

  # POST /accounts
  # POST /accounts.json
  def create
    @account = Account.new account_params

    if @account.save
      redirect_to accounts_url
    else
      render 'new'
    end
  end

  # PATCH/PUT /accounts/1
  # PATCH/PUT /accounts/1.json
  def update
    if @account.update account_params
      redirect_to accounts_url
    else
      render 'edit'
    end
  end

  # DELETE /accounts/1
  # DELETE /accounts/1.json
  def destroy
    @account.destroy
    redirect_to accounts_url
  end

  private

    def set_account
      @account = Account.find params[:id]
    end

    def account_params
      params.require(:account).permit :name, :subdomain, :lock_version
    end
end
