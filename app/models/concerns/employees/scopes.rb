module Employees::Scopes
  extend ActiveSupport::Concern

  included do
    scope :ordered, -> { order 'employees.lastname ASC' }
    scope :active, -> { where status: 'active' }
  end
end
