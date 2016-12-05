class Payment < ApplicationRecord
  include Auditable
  include Authority::Abilities
  include Payments::Validation

  default_scope -> { order 'number ASC' }

  belongs_to :loan

  scope :pendings, -> { where paid_at: nil }
end
