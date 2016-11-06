module MemberPayments::Reports
  extend ActiveSupport::Concern

  module ClassMethods
    def reports conditions
      includes(:customer).where(conditions).order('period DESC').references(:customer)
    end

    def summary reports
      {
        total: reports.count,
        debt: ActionController::Base.helpers.number_to_currency(reports.where(paid_at: nil).sum(:amount))
      }
    end
  end
end
