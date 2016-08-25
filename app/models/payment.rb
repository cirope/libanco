class Payment < ApplicationRecord
  include Auditable
  include Authority::Abilities
  include Payments::Validation

  belongs_to :loan
end
