class Schedule < ApplicationRecord
  include Auditable
  include Authority::Abilities
  include Attributes::Strip
  include Schedules::Validation
  include Schedules::Scopes
  include Schedules::Reminders
  include Schedules::Done

  strip_fields :description

  delegate :full_name, :address, :phone, :cellphone, to: :schedulable, allow_nil: false

  belongs_to :user
  belongs_to :schedulable, polymorphic: true, optional: true
  has_many :reminders, dependent: :destroy
end
