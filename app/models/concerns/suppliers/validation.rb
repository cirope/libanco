module Suppliers::Validation
  extend ActiveSupport::Concern

  included do
    STATUSES = ['active', 'inactive']

    validates :legal_name, presence: true, length: { maximum: 255 }
    validates :status, inclusion: { in: STATUSES }
    validates :tax_id, presence: true, uniqueness: { case_sensitive: false }
  end
end
