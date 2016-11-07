module MemberPayments::Reports
  extend ActiveSupport::Concern

  module ClassMethods
    def reports conditions
      includes(:customer).where(conditions).order('period DESC').references(:customer)
    end

    def summary reports
      {
        amount: ActionController::Base.helpers.number_to_currency(reports.sum(:amount)),
        debt: ActionController::Base.helpers.number_to_currency(
          reports.where('paid_at IS NULL AND expire_at > ?', Date.today).sum(:amount)
        )
      }
    end
  end
end
