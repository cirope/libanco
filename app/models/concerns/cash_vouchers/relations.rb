module CashVouchers::Relations
  extend ActiveSupport::Concern

  included do
    belongs_to :cash
    belongs_to :owner, polymorphic: true
    belongs_to :user
    has_many :cash_invoices, dependent: :destroy
  end
end
