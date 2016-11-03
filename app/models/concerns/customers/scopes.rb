module Customers::Scopes
  extend ActiveSupport::Concern

  included do
    scope :ordered, -> { order 'customers.created_at DESC' }
  end

  def full_address
    [address, neighborhood, city, state].compact.join ', '
  end
end
