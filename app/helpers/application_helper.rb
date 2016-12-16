module ApplicationHelper
  def title
    [app_name, @title].compact.join(' | ')
  end

  def app_name
    t 'app_name'
  end

  def menu_item_for model, path, icon = nil
    menu_link_for(model, path, icon) if current_user.can_list? model
  end

  def menu_for model, path, icon = nil
    menu_link_for(model, path, icon) if current_user.can_read? model
  end

  def t_boolean field
    if field
      icon = 'check-square-o'
      text_class = 'text-success'
    else
      icon = 'minus-square'
      text_class = 'text-danger'
    end

    content_tag :span, fa_icon(icon), class: text_class
  end

  def t_field object, field
    if object
      model = object.class.model_name.plural

      t object.send(field), scope: [model, field.pluralize] if object.send(field).present?
    end
  end

  def show_annulled_label annulled
    content_tag(:span, t('cashes.annulled'), class: 'label label-danger') if annulled
  end

  private

    def menu_link_for model, path, icon = nil
      model_name = model.model_name.human(count: 0)
      model_name = fa_icon(icon, text: model_name) if icon

      link = link_to model_name, path
      active = model.model_name.route_key == controller_name

      content_tag(:li, link, (active ? { class: 'active' } : {}))
    end
end
