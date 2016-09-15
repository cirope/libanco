class Payment < ApplicationRecord
  include Auditable
  include Authority::Abilities
  include Payments::Validation

  default_scope -> { order 'number ASC' }

  belongs_to :loan
end
