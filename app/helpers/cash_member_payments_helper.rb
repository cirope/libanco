module CashMemberPaymentsHelper
  def link_to_cash_member_template cmp, custom_template
    link_to fa_icon('file-pdf-o'),
      custom_template_generate_url(custom_template, format: :pdf, templatable_id: cmp.id), target: '_blank'
  end
end
