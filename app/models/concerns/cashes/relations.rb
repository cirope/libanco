module Cashes::Relations
  extend ActiveSupport::Concern

  included do
    belongs_to :user
    has_many :cash_member_payments, dependent: :destroy
    has_many :member_payments, through: :cash_member_payments
    has_many :invoices, dependent: :destroy
  end
end
