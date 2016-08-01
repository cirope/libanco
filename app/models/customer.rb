class Customer < ApplicationRecord
  include Attributes::Strip
  include Auditable
  include Authority::Abilities
  include Customers::Relations
  include Customers::Validation
  include SearchCop

  default_scope -> { order 'customers.lastname ASC' }

  strip_fields :name, :lastname, :code, :identification, :email,
    :address, :work_address, :phone

  search_scope :search do
    attributes :name, :lastname, :identification
  end

  def to_s
    [name, lastname].join ' '
  end
end
