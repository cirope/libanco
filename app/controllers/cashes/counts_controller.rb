class Cashes::CountsController < ApplicationController
  include Authentication
  include Cash::Scoped
  include Title

  def edit
  end

  def update
    if @cash.update cash_params
      redirect_to @cash, turbolinks: true
    else
      render 'edit'
    end
  end

  private

    def cash_params
      params.require(:cash).permit :closing_balance, :lock_version
    end
end
