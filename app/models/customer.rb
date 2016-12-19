class Customer < ApplicationRecord
  include Attributes::Strip
  include Auditable
  include Authority::Abilities
  include Customers::Defaults
  include Customers::Relations
  include Customers::Scopes
  include Customers::Templates
  include Customers::Validation
  include SearchCop

  alias_method :full_name, :to_s

  strip_fields :name, :lastname, :code, :identification, :email,
    :address, :work_address, :phone, :cellphone, :place_birth

  search_scope :search do
    attributes :name, :lastname, :identification, :code
    attributes card: ['card.name']
  end

  def to_s
    [lastname, name].join ', '
  end
end
