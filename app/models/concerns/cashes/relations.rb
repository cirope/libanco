module Cashes::Relations
  extend ActiveSupport::Concern

  included do
    belongs_to :user
    has_many :cash_employees, dependent: :destroy
    has_many :cash_invoices, dependent: :destroy
    has_many :cash_member_payments, dependent: :destroy
    has_many :member_payments, through: :cash_member_payments
    has_many :cash_payments, dependent: :destroy
    has_many :payments, through: :cash_payments
    has_many :cash_vouchers, dependent: :destroy
  end
end
