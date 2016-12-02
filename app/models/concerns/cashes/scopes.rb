module Cashes::Scopes
  extend ActiveSupport::Concern

  module ClassMethods
    def current_cash
      where(status: 'opened').take
    end
  end

  included do
    scope :ordered, -> { order 'created_at DESC' }
  end

  def opened?
    status == 'opened'
  end
end
