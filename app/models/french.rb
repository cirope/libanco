class French < Loan
  include Loans::FrenchPayment
  include Loans::FrenchPayments
end
