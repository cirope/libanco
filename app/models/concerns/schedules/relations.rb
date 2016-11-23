module Schedules::Relations
  extend ActiveSupport::Concern

  included do
    belongs_to :user
    belongs_to :schedulable, polymorphic: true, optional: true
    has_many :reminders, dependent: :destroy
  end
end
