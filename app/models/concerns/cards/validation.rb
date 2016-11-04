module Cards::Validation
  extend ActiveSupport::Concern

  included do
    validates :name, uniqueness: { case_sensitive: false }, length: { maximum: 255 },
      presence: true
    validates :admission_fee, :monthly_fee, presence: true,
      numericality: { greater_than_or_equal_to: 0 }
    validates :active, inclusion: { in: [true, false] }
  end
end
