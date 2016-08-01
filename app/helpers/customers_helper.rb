module CustomersHelper
  def identification_types
    Customer::TYPES.map { |it| [t("customers.identification_types.#{it}"), it] }
  end

  def customer_cards
    Customer::CARDS.map { |cc| [t("customers.cards.#{cc}"), cc] }
  end
end
