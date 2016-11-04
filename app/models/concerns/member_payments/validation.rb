module MemberPayments::Validation
  extend ActiveSupport::Concern

  included do
    validates :amount, presence: true, numericality: { greater_than: 0 }
    validates_date :expire_at
  end
end
