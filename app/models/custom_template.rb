class CustomTemplate < ApplicationRecord
  include Attributes::Strip
  include Auditable
  include Authority::Abilities
  include CustomTemplates::Relations
  include CustomTemplates::Scopes
  include CustomTemplates::Validation

  strip_fields :name

  def to_s
    name
  end
end
