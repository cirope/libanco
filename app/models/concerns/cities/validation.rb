module Cities::Validation
  extend ActiveSupport::Concern

  included do
    validates :name, uniqueness: { case_sensitive: false, scope: :state },
      length: { maximum: 255 }, presence: true
    validates :state, presence: true
  end
end
