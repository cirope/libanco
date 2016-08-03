module References::Validation
  extend ActiveSupport::Concern

  included do
    TYPES = ['dni', 'cie', 'passport']

    validates :name, :lastname, :identification_type, :identification,
      :phone, presence: true, length: { maximum: 255 }
    validates :identification, uniqueness: { case_sensitive: false },
      length: { maximum: 255 }, presence: true
    validates :identification_type, inclusion: { in: TYPES }
  end
end
