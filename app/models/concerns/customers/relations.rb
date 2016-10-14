module Customers::Relations
  extend ActiveSupport::Concern

  included do
    belongs_to :adviser, optional: true
    belongs_to :card
    belongs_to :city, optional: true
    belongs_to :education_level, optional: true
    belongs_to :marital_status, optional: true
    belongs_to :nacionality, optional: true
    belongs_to :neighborhood, optional: true
    belongs_to :occupation, optional: true
    belongs_to :state, optional: true
    belongs_to :workgroup, optional: true
    has_many :references, dependent: :destroy
    has_many :loans
    accepts_nested_attributes_for :references, allow_destroy: false,
      reject_if: :all_blank
  end
end
