class Customers::SearchesController < ApplicationController
  include Authentication

  def index
    @customers = Customer.members.search(params[:q]).limit 10
  end
end
