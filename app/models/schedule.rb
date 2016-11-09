class Schedule < ApplicationRecord
  include Auditable
  include Authority::Abilities
  include Attributes::Strip
  include Schedules::Validation
  include Schedules::Scopes
  include Schedules::Reminders
  include Schedules::Done

  strip_fields :description

  belongs_to :user
  belongs_to :customer, optional: true
  has_many :reminders, dependent: :destroy
end
