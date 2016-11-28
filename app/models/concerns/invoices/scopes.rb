module Invoices::Scopes
  extend ActiveSupport::Concern

  included do
    scope :ordered, -> { order 'invoices.created_at DESC' }
  end
end
