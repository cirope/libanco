module CreditLines::Validation
  extend ActiveSupport::Concern

  included do
    validates :name, uniqueness: { case_sensitive: false }, length: { maximum: 255 },
      presence: true
    validates :commission, :commission_max, :interest, :tax, :tax_perception,
      :gross_income_perception, :gross_income_perception_min, :insurance, :stamped,
      presence: true, numericality: { greater_than_or_equal_to: 0 }
  end
end
