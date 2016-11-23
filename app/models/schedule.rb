class Schedule < ApplicationRecord
  include Auditable
  include Authority::Abilities
  include Attributes::Strip
  include Schedules::Done
  include Schedules::Relations
  include Schedules::Reminders
  include Schedules::Scopes
  include Schedules::Validation

  delegate :phone, :cellphone, :full_address, to: :schedulable

  strip_fields :description
end
