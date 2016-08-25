module Loans::Defaults
  extend ActiveSupport::Concern

  included do
    before_validation :set_defaults
  end

  private

    def set_defaults
      self.credit_line_data = credit_line.attributes if credit_line
      self.status ||= 'current'
    end
end
