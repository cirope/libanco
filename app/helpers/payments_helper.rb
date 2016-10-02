module PaymentsHelper
  def link_to_payment_paid_at payment
    content_tag :div do
      concat(content_tag :span, (payment.paid_at ? l(payment.paid_at.to_date) : ''))
      concat(content_tag :span, link_to(fa_icon('calendar'), [:edit, payment.loan, payment], data: { remote: true }), class: 'pull-right')
    end
  end
end
