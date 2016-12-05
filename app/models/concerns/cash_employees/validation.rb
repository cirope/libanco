module CashEmployees::Validation
  extend ActiveSupport::Concern

  included do
    validates :amount, presence: true, numericality: { greater_than: 0 }
    validates :employee, uniqueness: { scope: :period }
  end
end
