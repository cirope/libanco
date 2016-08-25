module Loans::French
  extend ActiveSupport::Concern

  included do
    after_save :calculate_payments
  end

  private

    def calculate_payments

    end
end
