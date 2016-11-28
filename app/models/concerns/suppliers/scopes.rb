module Suppliers::Scopes
  extend ActiveSupport::Concern

  included do
    scope :ordered, -> { order 'suppliers.legal_name ASC' }
  end
end
