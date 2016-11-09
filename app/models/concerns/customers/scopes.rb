module Customers::Scopes
  extend ActiveSupport::Concern

  included do
    scope :ordered, -> { order 'customers.created_at DESC' }
    scope :members, -> { where member: true }
  end

  def full_address
    [address, neighborhood, city, state].compact.join ', '
  end

  def has_schedule_pending?
    schedules.any? { |s| !s.done }
  end
end
