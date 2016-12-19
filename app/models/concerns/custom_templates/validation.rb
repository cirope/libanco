module CustomTemplates::Validation
  extend ActiveSupport::Concern

  included do
    KINDS = ['Customer', 'CashMemberPayment', 'CashPayment', 'CashEmployee', 'CashVoucher']

    validates :content, presence: true
    validates :name, uniqueness: { case_sensitive: false }, length: { maximum: 255 },
      presence: true
    validates :kind, presence: true, inclusion: { in: KINDS }
  end
end
