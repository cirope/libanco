class Account < ApplicationRecord
  include Attributes::Strip
  include Attributes::Downcase
  include Auditable
  include Authority::Abilities
  include Accounts::Tenant
  include Accounts::Validation

  strip_fields :name, :subdomain
  downcase_fields :subdomain

  has_many :users, dependent: :destroy

  def to_s
    name
  end
end
