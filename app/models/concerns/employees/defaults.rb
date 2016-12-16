module Employees::Defaults
  extend ActiveSupport::Concern

  included do
    before_validation :set_defaults
  end

  private

    def set_defaults
      self.status ||= 'active'
    end
end
