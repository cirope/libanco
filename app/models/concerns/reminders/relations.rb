module Reminders::Relations
  extend ActiveSupport::Concern

  included do
    belongs_to :schedule
    has_one :user, through: :schedule
    has_one :customer, through: :schedule
  end
end
