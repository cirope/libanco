module PaymentMethods::Validation
  extend ActiveSupport::Concern

  included do
    validates :name, uniqueness: { case_sensitive: false }, length: { maximum: 255 },
      presence: true
    validates :cash_discount, inclusion: { in: [true, false] }
  end
end
