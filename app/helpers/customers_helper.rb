module CustomersHelper
  def identification_types
    Customer::TYPES.map { |it| [t("customers.identification_types.#{it}"), it] }
  end
end
