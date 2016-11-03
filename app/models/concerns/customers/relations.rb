module Customers::Relations
  extend ActiveSupport::Concern

  included do
    belongs_to :adviser
    belongs_to :card
    belongs_to :city
    belongs_to :education_level
    belongs_to :marital_status
    belongs_to :nacionality
    belongs_to :neighborhood, optional: true
    belongs_to :occupation
    belongs_to :state
    belongs_to :workgroup
    has_many :references, dependent: :destroy
    has_many :loans, dependent: :destroy
    has_many :member_payments, dependent: :destroy
    accepts_nested_attributes_for :references, allow_destroy: false,
      reject_if: :all_blank
  end
end
