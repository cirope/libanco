module CashEmployees::Relations
  extend ActiveSupport::Concern

  included do
    belongs_to :cash
    belongs_to :employee
    belongs_to :user
  end
end
