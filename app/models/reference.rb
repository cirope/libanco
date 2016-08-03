class Reference < ApplicationRecord
  include Attributes::Strip
  include Auditable
  include Authority::Abilities
  include References::Validation

  strip_fields :name, :lastname, :identification, :phone

  belongs_to :customer, optional: true
  belongs_to :relationship

  def to_s
    name
  end
end
