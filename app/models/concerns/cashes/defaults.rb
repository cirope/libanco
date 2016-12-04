module Cashes::Defaults
  extend ActiveSupport::Concern

  included do
    before_validation :set_defaults
  end

  private

    def set_defaults
      self.status ||= 'opened'
      self.balance ||= opening_balance
    end
end
