class Customer < ApplicationRecord
  include Attributes::Strip
  include Auditable
  include Authority::Abilities
  include Customers::Relations
  include Customers::Scopes
  include Customers::Validation
  include SearchCop

  strip_fields :name, :lastname, :code, :identification, :email,
    :address, :work_address, :phone, :place_birth

  search_scope :search do
    attributes :name, :lastname, :identification
  end

  def to_s
    [lastname, name].join ', '
  end
end
