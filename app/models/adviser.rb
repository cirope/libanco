class Adviser < ApplicationRecord
  include Attributes::Strip
  include Auditable
  include Authority::Abilities
  include Advisers::Validation

  default_scope -> { order 'advisers.lastname ASC' }

  strip_fields :name, :lastname, :identification, :phone

  def to_s
    [name, lastname].join ' '
  end
end
