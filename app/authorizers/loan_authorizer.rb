class LoanAuthorizer < ApplicationAuthorizer
  def self.default adjective, user
    true
  end
end
