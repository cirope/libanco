module Customers::Validation
  extend ActiveSupport::Concern

  included do
    TYPES = ['dni', 'cie', 'passport']

    validates :name, :lastname, :identification, :identification_type, presence: true #:address, :birthdate, :phone, :cellphone,
 #     :work_address, :monthly_income, :place_birth, presence: true
    validates :name, :lastname, :address, :cellphone, length: { maximum: 255 }
#    validates_date :birthdate
    validates :member, inclusion: { in: [true, false] }
    validates :identification, uniqueness: { scope: :identification_type }, length: { maximum: 255 }
#    validates :monthly_income, numericality: { greater_than: 0 }
    validates :identification_type, inclusion: { in: TYPES }
  end
end
