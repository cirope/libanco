module Cash::Scoped
  extend ActiveSupport::Concern

  included do
    before_action :set_cash
  end

  private

    def set_cash
      @cash = Cash.find params[:cash_id]
    end
end
