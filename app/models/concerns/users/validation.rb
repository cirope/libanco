module Users::Validation
  extend ActiveSupport::Concern

  included do
    validates :name, :lastname, :roles_mask, presence: true
    validates :name, :lastname, length: { maximum: 255 }
  end
end
