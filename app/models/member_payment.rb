class MemberPayment < ApplicationRecord
  include Auditable
  include Authority::Abilities
  include MemberPayments::Generate
  include MemberPayments::Reports
  include MemberPayments::Validation

  belongs_to :customer

  def to_s
    amount
  end
end
