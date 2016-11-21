module Investors::Validation
  extend ActiveSupport::Concern

  included do
    TYPES = ['dni', 'cie', 'passport']

    validates :name, :lastname, :identification, :identification_type, :address, :cellphone, presence: true
    validates :name, :lastname, :address, :cellphone, length: { maximum: 255 }
    validates :identification, uniqueness: { scope: :identification_type },
      numericality: { only_integer: true, greater_than_or_equal_to: 1_000_000, less_than: 1_000_000_000 }
    validates :identification_type, inclusion: { in: TYPES }
  end
end
