class SupplierAuthorizer < ApplicationAuthorizer
  def self.default able, user
    true
  end
end
