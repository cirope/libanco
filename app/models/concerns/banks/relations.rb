module Banks::Relations
  extend ActiveSupport::Concern

  included do
    has_many :bank_accounts, dependent: :destroy
    accepts_nested_attributes_for :bank_accounts, allow_destroy: false,
      reject_if: :all_blank
  end
end
