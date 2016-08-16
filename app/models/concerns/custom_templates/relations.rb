module CustomTemplates::Relations
  extend ActiveSupport::Concern

  included do
    has_many :custom_body_templates
    has_many :body_templates, through: :custom_body_templates
    belongs_to :header_template, optional: true
    belongs_to :footer_template, optional: true
    accepts_nested_attributes_for :custom_body_templates, allow_destroy: true,
      reject_if: :all_blank
  end
end
