class Payment < ApplicationRecord
  include Auditable
  include Authority::Abilities
  include Payments::Relations
  include Payments::Validation

  default_scope -> { order 'number ASC' }

  scope :pendings, -> { where paid_at: nil }
end
