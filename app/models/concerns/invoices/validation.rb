module Invoices::Validation
  extend ActiveSupport::Concern

  included do
    validates :number, presence: true, length: { maximum: 255 }
    validates :subtotal, :tax_amount, :tax_perception_amount,
      :gross_income_perception_amount, presence: true,
      numericality: { greater_than_or_equal_to: 0 }
    validates :amount, presence: true, numericality: { greater_than: 0 }
    validates_date :date
  end
end
