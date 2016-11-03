module Customers::Defaults
  extend ActiveSupport::Concern

  included do
    before_validation :set_defaults
  end

  private

    def set_defaults
      self.member = true if member.nil?
      self.starting_day ||= Date.today.day
    end
end
