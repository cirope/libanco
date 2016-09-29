class American < Loan
  include Loans::AmericanPayment
  include Loans::AmericanPayments
end
