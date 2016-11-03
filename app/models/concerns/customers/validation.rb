module Customers::Validation
  extend ActiveSupport::Concern

  included do
    TYPES = ['dni', 'cie', 'passport']

    validates :name, :lastname, :identification, :identification_type, :address, :birthdate, :cellphone,
      :monthly_income, :place_birth, presence: true
    validates :name, :lastname, :address, :cellphone, length: { maximum: 255 }
    validates_date :birthdate
    validates :member, inclusion: { in: [true, false] }
    validates :identification, uniqueness: { scope: :identification_type },
      numericality: { only_integer: true, greater_than_or_equal_to: 1_000_000, less_than: 1_000_000_000 }
    validates :monthly_income, numericality: { greater_than_or_equal_to: 0 }
    validates :identification_type, inclusion: { in: TYPES }
    validates :starting_day, numericality: { only_integer: true,
      greater_than_or_equal_to: 1, less_than_or_equal_to: 31 }
    validates :member, inclusion: { in: [true, false] }
  end
end
