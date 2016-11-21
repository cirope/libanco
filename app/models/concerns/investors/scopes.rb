module Investors::Scopes
  extend ActiveSupport::Concern

  included do
    scope :ordered, -> { order 'investors.created_at DESC' }
  end

  def full_address
    [address, city, state].compact.join ', '
  end

  def has_schedule_pending?
    schedules.any? { |s| !s.done }
  end
end
