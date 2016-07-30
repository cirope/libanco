module ApplicationHelper
  def title
    [app_name, @title].compact.join(' | ')
  end

  def app_name
    t 'app_name'
  end

  def menu_item_for model, path, icon = nil
    if current_user.can_read? model
      model_name = model.model_name.human(count: 0)
      model_name = fa_icon(icon, text: model_name) if icon

      link = link_to model_name, path
      active = model.model_name.route_key == controller_name

      content_tag(:li, link, (active ? { class: 'active' } : {}))
    end
  end
end
