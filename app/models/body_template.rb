class BodyTemplate < ApplicationRecord
  include Attributes::Strip
  include Auditable
  include Authority::Abilities
  include BodyTemplates::Validation

  strip_fields :name, :content

  def to_s
    name
  end
end
