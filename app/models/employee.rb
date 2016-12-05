class Employee < ApplicationRecord
  include Attributes::Strip
  include Auditable
  include Authority::Abilities
  include Employees::Defaults
  include Employees::Scopes
  include Employees::Validation
  include SearchCop

  strip_fields :tax_id, :name, :lastname

  search_scope :search do
    attributes :name, :lastname, :tax_id
  end

  def to_s
    [name, lastname].join ' '
  end

  def label
    "#{to_s} (#{tax_id})"
  end
end
