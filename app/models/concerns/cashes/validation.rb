module Cashes::Validation
  extend ActiveSupport::Concern

  included do
    STATUSES = ['opened', 'closed']

    validates :opened_at, :status, :opening_balance, :user, presence: true
    validates :opening_balance, numericality: { greater_than_or_equal_to: 0 }
    validates :status, inclusion: { in: STATUSES }, allow_nil: true, allow_blank: true
    validates_date :opened_at, on_or_before: :today, allow_nil: true, allow_blank: true
    validates :closing_balance, presence: true, numericality: { greater_than_or_equal_to: 0 }, on: :update
  end
end
