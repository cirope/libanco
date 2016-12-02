module Suppliers::Scopes
  extend ActiveSupport::Concern

  included do
    scope :ordered, -> { order 'suppliers.legal_name ASC' }
    scope :active, -> { where status: 'active' }
  end
end
