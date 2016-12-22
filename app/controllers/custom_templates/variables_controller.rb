class CustomTemplates::VariablesController < ApplicationController
  include Authentication

  def index
    head :ok if params[:kind].blank?
  end
end
