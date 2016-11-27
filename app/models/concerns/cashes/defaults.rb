module Cashes::Defaults
  extend ActiveSupport::Concern

  included do
    after_initialize :set_opened_at
    before_validation :set_defaults
  end

  private

    def set_opened_at
      self.opened_at ||= Date.today
    end

    def set_defaults
      self.status ||= 'opened'
    end
end
