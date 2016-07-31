class City < ApplicationRecord
  include Attributes::Strip
  include Auditable
  include Authority::Abilities
  include Cities::Validation

  strip_fields :name

  belongs_to :state

  def to_s
    name
  end
end
