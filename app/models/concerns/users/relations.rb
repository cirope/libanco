module Users::Relations
  extend ActiveSupport::Concern

  included do
    belongs_to :account
  end
end
