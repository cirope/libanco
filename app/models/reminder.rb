class Reminder < ApplicationRecord
  include DisableSti
  include Auditable
  include CurrentAccount
  include Reminders::Validation
  include Reminders::Delivery
  include Reminders::DestroyConstraints
  include Reminders::Relations

  delegate :email, to: :user, prefix: true
  delegate :scheduled_at, :description, to: :schedule
  delegate :schedulable, :phone, :cellphone, :full_address, to: :schedule

  default_scope -> { order("#{table_name}.remind_at ASC") }
end
