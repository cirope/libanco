class BankAccounts::SearchesController < ApplicationController
  include Authentication

  def index
    @bank_accounts = BankAccount.search(params[:q]).limit 10
  end
end
