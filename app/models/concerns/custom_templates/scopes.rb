module CustomTemplates::Scopes
  extend ActiveSupport::Concern

  included do
    default_scope -> { order 'custom_templates.name ASC' }
    scope :templates_for, ->(kind) { where kind: kind }
  end
end
