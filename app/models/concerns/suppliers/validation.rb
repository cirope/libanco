module Suppliers::Validation
  extend ActiveSupport::Concern

  included do
    STATUSES = ['active', 'inactive']

    validates :tax_id, :legal_name, presence: true, length: { maximum: 255 }
    validates :status, inclusion: { in: STATUSES }
    validates :tax_id, format: { with: TAX_ID_REGEX }
  end
end
