class Cashes::FlowsController < ApplicationController
  include Authentication
  include Cash::Scoped
  include Title

  def index
  end
end
