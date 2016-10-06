module Users::Relations
  extend ActiveSupport::Concern

  included do
    belongs_to :account
    has_many :schedules, dependent: :destroy
  end
end
