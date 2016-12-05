module CashPayments::Relations
  extend ActiveSupport::Concern

  included do
    belongs_to :cash
    belongs_to :customer
    belongs_to :payment
    belongs_to :user
  end
end
