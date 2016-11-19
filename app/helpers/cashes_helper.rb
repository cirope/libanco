module CashesHelper
  def show_cash_status cash
    status_class = case cash.status
      when 'opened' then 'label label-success'
      when 'closed' then 'label label-danger'
    end

    content_tag :span, t("cashes.statuses.#{cash.status}"), class: status_class
  end

  def show_lock_status unlocked
    if unlocked
      content_tag :span, fa_icon('unlock-alt'), class: 'text-success'
    else
      content_tag :span, fa_icon('lock'), class: 'text-danger'
    end
  end

  def link_to_flows cash
    link_to cash_flows_url(cash), title: t('flows.index.title') do
      content_tag :i, nil, class: 'fa fa-exchange'
    end
  end
end
