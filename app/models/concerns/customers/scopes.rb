module Customers::Scopes
  extend ActiveSupport::Concern

  included do
    default_scope -> { order 'customers.lastname ASC' }
  end

  def full_address
    [address, neighborhood, city, state].compact.join ', '
  end
end
