class InvoiceType < ApplicationRecord
  include Attributes::Strip
  include Auditable
  include Authority::Abilities
  include InvoiceTypes::Validation

  default_scope -> { order 'invoice_types.name ASC' }

  strip_fields :name

  def to_s
    name
  end
end
