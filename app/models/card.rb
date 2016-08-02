class Card < ApplicationRecord
  include Attributes::Strip
  include Auditable
  include Authority::Abilities
  include Cards::Validation

  default_scope -> { order 'cards.name ASC' }

  strip_fields :name

  def to_s
    name
  end
end
