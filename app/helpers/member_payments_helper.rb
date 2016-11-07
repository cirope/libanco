module MemberPaymentsHelper
  def show_paid_at_label paid_at
    label_class = paid_at ? 'label label-success' : 'label label-danger'

    content_tag :span, t("member_payments.payments.#{(paid_at ? 'paid' : 'unpaid')}"), class: label_class
  end
end
