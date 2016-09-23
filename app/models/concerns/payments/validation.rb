module Payments::Validation
  extend ActiveSupport::Concern

  included do
    validates :number, presence: true, numericality: { only_integer: true }
    validates :capital, :amount, :interest, :tax, :tax_perception, :gross_income_perception,
      :balance, :insurance, presence: true, numericality: true
    validates_date :expire_at
  end
end
