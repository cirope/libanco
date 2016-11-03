module MemberPayments::Validation
  extend ActiveSupport::Concern

  included do
    validates :amount, presence: true, numericality: { greater_than: 0 }
    validates_date :expired_at
  end
end
