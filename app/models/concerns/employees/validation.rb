module Employees::Validation
  extend ActiveSupport::Concern

  included do
    STATUSES = ['active', 'inactive']

    validates :name, :lastname, presence: true, length: { maximum: 255 }
    validates :status, inclusion: { in: STATUSES }
    validates :tax_id, presence: true, uniqueness: { case_sensitive: false },
      format: { with: TAX_ID_REGEX }
  end
end
