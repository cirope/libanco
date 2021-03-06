class City < ApplicationRecord
  include Attributes::Strip
  include Auditable
  include Authority::Abilities
  include Cities::Validation

  default_scope -> { order 'cities.name ASC' }

  strip_fields :name

  belongs_to :state

  def to_s
    name
  end
end
