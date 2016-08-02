module Customers::Relations
  extend ActiveSupport::Concern

  included do
    belongs_to :adviser
    belongs_to :card, optional: true
    belongs_to :city
    belongs_to :education_level
    belongs_to :marital_status
    belongs_to :nacionality
    belongs_to :neighborhood, optional: true
    belongs_to :occupation
    belongs_to :state
  end
end
