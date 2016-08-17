class HeaderTemplate < ApplicationRecord
  include Attributes::Strip
  include Auditable
  include Authority::Abilities
  include HeaderTemplates::Validation

  mount_uploader :image, ImageUploader

  default_scope -> { order 'header_templates.name ASC' }

  strip_fields :name

  belongs_to :account

  delegate :subdomain, to: :account, allow_nil: false

  def to_s
    name
  end
end
