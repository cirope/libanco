class Invoice < ApplicationRecord
  include Attributes::Strip
  include Auditable
  include Authority::Abilities
  include Invoices::Relations
  include Invoices::Scopes
  include Invoices::Validation

  strip_fields :number, :detail

  def to_s
    number
  end
end
