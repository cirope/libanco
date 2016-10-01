class American < Loan
  include Loans::AmericanPayment
  include Loans::AmericanPayments

  def self.model_name
    superclass.model_name
  end
end
