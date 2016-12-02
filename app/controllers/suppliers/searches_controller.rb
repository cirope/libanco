class Suppliers::SearchesController < ApplicationController
  include Authentication

  def index
    @suppliers = Supplier.active.search(params[:q]).limit 10
  end
end
