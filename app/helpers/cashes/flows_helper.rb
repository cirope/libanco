module Cashes::FlowsHelper
  def link_to_cash_flow_item model
    classes = model == CashMemberPayment ? 'list-group-item active' : 'list-group-item'

    link_to model.model_name.human(count: 0), [@cash, model], remote: true, class: classes
  end
end
