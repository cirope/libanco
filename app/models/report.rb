class Report
  include ActiveModel::Model
  include Authority::Abilities
  include Reports::Defaults
  include Reports::Conditions
  include Reports::Scopes

  attr_accessor :filter, :date_range, :from, :to, :customer, :customer_id,
    :supplier, :supplier_id, :employee, :employee_id
end
