class Adviser < ApplicationRecord
  include Attributes::Strip
  include Auditable
  include Authority::Abilities
  include Advisers::Validation

  default_scope -> { order 'advisers.name ASC' }

  strip_fields :name

  def to_s
    name
  end
end
