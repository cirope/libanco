module CashMemberPayments::Relations
  extend ActiveSupport::Concern

  included do
    belongs_to :cash
    belongs_to :customer
    belongs_to :member_payment
    belongs_to :user
  end
end
