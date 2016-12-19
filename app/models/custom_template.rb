class CustomTemplate < ApplicationRecord
  include Attributes::Strip
  include Auditable
  include Authority::Abilities
  include CustomTemplates::Relations
  include CustomTemplates::Validation

  default_scope -> { order 'custom_templates.name ASC' }
  scope :customers, -> { where kind: 'Customer' }
  scope :cash_member_payments, -> { where kind: 'CashMemberPayment' }

  def model_constant
    kind.constantize
  end

  strip_fields :name

  def to_s
    name
  end
end
