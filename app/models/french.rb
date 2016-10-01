class French < Loan
  include Loans::FrenchPayment
  include Loans::FrenchPayments

  def self.model_name
    superclass.model_name
  end
end
