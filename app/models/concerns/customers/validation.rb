module Customers::Validation
  extend ActiveSupport::Concern

  included do
    TYPES = ['dni', 'cie', 'passport']

    validates :name, :lastname, :identification, :address, :birthdate, :phone,
      :work_address, :identification_type, :monthly_income, :place_birth, presence: true
    validates :name, :lastname, :address, length: { maximum: 255 }
    validates_date :birthdate
    validates :member, inclusion: { in: [true, false] }
    validates :identification, uniqueness: { case_sensitive: false }, length: { maximum: 255 }
    validates :monthly_income, numericality: { greater_than: 0 }
    validates :identification_type, inclusion: { in: TYPES }
  end
end
