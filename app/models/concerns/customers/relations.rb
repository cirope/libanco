module Customers::Relations
  extend ActiveSupport::Concern

  included do
    belongs_to :adviser, optional: true
    belongs_to :card
    belongs_to :city
    belongs_to :education_level
    belongs_to :marital_status
    belongs_to :nacionality
    belongs_to :neighborhood, optional: true
    belongs_to :occupation, optional: true
    belongs_to :state
    belongs_to :workgroup, optional: true
    has_many :references, dependent: :destroy
    has_many :loans, dependent: :destroy
    has_many :member_payments, dependent: :destroy
    has_many :schedules, as: :schedulable, dependent: :destroy
    accepts_nested_attributes_for :references, allow_destroy: false,
      reject_if: :all_blank
  end
end
