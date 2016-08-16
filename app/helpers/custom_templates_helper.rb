module CustomTemplatesHelper
  def custom_body_templates model
    model.custom_body_templates.new if model.custom_body_templates.blank?
    model.custom_body_templates
  end
end
