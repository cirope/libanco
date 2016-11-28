class Supplier < ApplicationRecord
  include Attributes::Strip
  include Auditable
  include Authority::Abilities
  include Suppliers::Defaults
  include Suppliers::Scopes
  include Suppliers::Validation

  strip_fields :tax_id, :legal_name

  def to_s
    legal_name
  end
end
