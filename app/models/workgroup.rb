class Workgroup < ApplicationRecord
  include Attributes::Strip
  include Auditable
  include Authority::Abilities
  include Workgroups::Validation

  default_scope -> { order 'workgroups.name ASC' }

  strip_fields :name

  def to_s
    name
  end
end
