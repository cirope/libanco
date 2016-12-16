class PaymentMethod < ApplicationRecord
  include Attributes::Strip
  include Auditable
  include Authority::Abilities
  include PaymentMethods::Validation

  default_scope -> { order 'payment_methods.name ASC' }

  strip_fields :name

  def to_s
    name
  end
end
