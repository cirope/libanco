module Schedules::Schedulable
  extend ActiveSupport::Concern

  included do
    delegate :customer, :phones, :customer_address, to: :schedulable
    belongs_to :schedulable, polymorphic: true, optional: true
  end
end
