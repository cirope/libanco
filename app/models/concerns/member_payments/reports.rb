module MemberPayments::Reports
  extend ActiveSupport::Concern

  module ClassMethods
    def reports conditions
      includes(:customer).where(conditions).order('customers.lastname ASC').references(:customer)
    end
  end
end
