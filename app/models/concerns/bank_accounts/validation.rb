module BankAccounts::Validation
  extend ActiveSupport::Concern

  included do
    validates :account, presence: true, uniqueness: { scope: :bank }
    validates :cbu, presence: true, uniqueness: { case_sensitive: false },
      length: { is: 22 }
  end
end
