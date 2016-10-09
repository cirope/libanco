module CustomersHelper
  def identification_types
    Customer::TYPES.map { |it| [t("customers.identification_types.#{it}"), it] }
  end

  def customer_references model
    model.references.new if model.references.blank?
    model.references
  end

  def link_to_customer_loans customer
    if customer.loans.exists?
      link_to fa_icon('file-text'), customer_loans_path(customer), title: Loan.model_name.human(count: 0)
    end
  end
end
