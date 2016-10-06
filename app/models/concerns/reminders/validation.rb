module Reminders::Validation
  extend ActiveSupport::Concern

  included do
    TYPES = ['email']

    validates :remind_at, :type, presence: true
    validates :type, length: { maximum: 255 }, inclusion: { in: TYPES }
    validates :remind_at, timeliness: { on_or_before: :scheduled_at, type: :datetime }
  end
end
