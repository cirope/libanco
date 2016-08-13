class State < ApplicationRecord
  include Attributes::Strip
  include Auditable
  include Authority::Abilities
  include States::Validation

  default_scope -> { order 'states.name ASC' }

  strip_fields :name

  has_many :cities, dependent: :destroy

  def to_s
    name
  end
end
