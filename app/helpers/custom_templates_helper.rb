module CustomTemplatesHelper
  def custom_templates_kinds
    CustomTemplate::KINDS.map { |k| [t("custom_templates.kinds.#{k}"), k] }
  end

  def link_to_custom_template model, ct
    link_to fa_icon('file-pdf-o'),
      custom_template_generate_url(ct, format: :pdf, templatable_id: model.id), target: '_blank'
  end
end
