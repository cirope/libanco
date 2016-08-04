module LoanTypes::Validation
  extend ActiveSupport::Concern

  included do
    validates :name, uniqueness: { case_sensitive: false }, length: { maximum: 255 },
      presence: true
    validates :initial_percentage, :annual_percentage, presence: true,
      numericality: { greater_than_or_equal_to: 0 }
  end
end
