module Cards::Validation
  extend ActiveSupport::Concern

  included do
    validates :name, uniqueness: { case_sensitive: false }, length: { maximum: 255 },
      presence: true
    validates :admission_fee, :monthly_fee, presence: true,
      numericality: { greater_than: 0 }
  end
end
