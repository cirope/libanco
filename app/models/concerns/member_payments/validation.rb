module MemberPayments::Validation
  extend ActiveSupport::Concern

  included do
    validates :amount, presence: true, numericality: { greater_than_or_equal_to: 0 }
    validates :period, uniqueness: { scope: :customer }
    validates_date :expire_at
    validates_date :period
  end
end
