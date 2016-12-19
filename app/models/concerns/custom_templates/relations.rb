module CustomTemplates::Relations
  extend ActiveSupport::Concern

  included do
    belongs_to :header_template, optional: true
    belongs_to :footer_template, optional: true
  end
end
