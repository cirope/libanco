module CustomersHelper
  def identification_types
    Customer::TYPES.map { |it| [t("customers.identification_types.#{it}"), it] }
  end

  def customer_references model
    model.references.new if model.references.blank?
    model.references
  end
end
