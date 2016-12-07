module CashVouchers::Reports
  extend ActiveSupport::Concern

  module ClassMethods
    def reports conditions
      includes(:employee).where(conditions).order('created_at DESC').references(:employee)
    end

    def summary reports
      { total: ActionController::Base.helpers.number_to_currency(reports.sum(:amount)) }
    end
  end
end
