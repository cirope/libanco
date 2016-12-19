module CustomTemplatesHelper
  def custom_templates_kinds
    CustomTemplate::KINDS.map { |k| [t("custom_templates.kinds.#{k}"), k] }
  end
end
