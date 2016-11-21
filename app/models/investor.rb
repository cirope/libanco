class Investor < ApplicationRecord
  include Attributes::Strip
  include Auditable
  include Authority::Abilities
  include Investors::Relations
  include Investors::Scopes
  include Investors::Validation
  include SearchCop

  strip_fields :name, :lastname, :identification, :address,
    :phone, :cellphone

  search_scope :search do
    attributes :name, :lastname, :identification
  end

  def to_s
    [lastname, name].join ', '
  end
end
