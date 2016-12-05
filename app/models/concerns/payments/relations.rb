module Payments::Relations
  extend ActiveSupport::Concern

  included do
    belongs_to :loan
    has_one :credit_line, through: :loan
  end
end
