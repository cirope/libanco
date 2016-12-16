module Cashes::UpdateBalance
  extend ActiveSupport::Concern


  included do
    after_save :update_balance
    after_destroy :update_balance
  end

  private

    def update_balance
      cash.update_balance
    end
end
