class Cash < ApplicationRecord
  include Auditable
  include Authority::Abilities
  include Cashes::Defaults
  include Cashes::Validation
  include Cashes::Scopes

  belongs_to :user
  has_many :cash_member_payments, dependent: :destroy
end
