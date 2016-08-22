class CustomerAuthorizer < ApplicationAuthorizer
  def self.default adjective, user
    true
  end
end
