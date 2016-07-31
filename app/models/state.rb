class State < ApplicationRecord
  include Attributes::Strip
  include Auditable
  include Authority::Abilities
  include States::Validation

  strip_fields :name

  def to_s
    name
  end
end
