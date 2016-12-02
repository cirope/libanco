class Supplier < ApplicationRecord
  include Attributes::Strip
  include Auditable
  include Authority::Abilities
  include Suppliers::Defaults
  include Suppliers::Scopes
  include Suppliers::Validation
  include SearchCop

  strip_fields :tax_id, :legal_name

  search_scope :search do
    attributes :legal_name, :tax_id
  end

  def to_s
    legal_name
  end

  def label
    "#{legal_name} (#{tax_id})"
  end
end
