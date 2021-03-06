module Loans::Relations
  extend ActiveSupport::Concern

  included do
    belongs_to :customer, optional: true
    belongs_to :credit_line
    has_many :payments, dependent: :destroy
  end
end
