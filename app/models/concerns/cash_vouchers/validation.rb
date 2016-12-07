module CashVouchers::Validation
  extend ActiveSupport::Concern

  included do
    STATUSES = ['assigned', 'pending']

    validates :comment, presence: true, length: { maximum: 255 }
    validates :amount, presence: true, numericality: { greater_than: 0 }
    validates :status, presence: true, inclusion: { in: STATUSES }
  end
end
