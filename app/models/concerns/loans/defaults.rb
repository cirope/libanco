module Loans::Defaults
  extend ActiveSupport::Concern

  included do
    after_initialize :set_defaults
    after_validation :calculate_amount_total, :set_expire_at, :calculate_payment, if: :loan_valid?
    before_save :set_data
    after_save :calculate_payments
  end

  def calculate_expire_at
    expire_date = payment_frequency_days(payments_count)
    expire_at_corrector(expire_date)
  end

  private

    def set_defaults
      self.status ||= 'current'
      self.payment_frequency ||= 30
      self.first_payment_days = payment_frequency
    end

    def calculate_amount_total
      calculate_commission
      calculate_tax
      calculate_stamped
			calculate_tax_perception
			calculate_gross_income_perception

			self.amount_total = amount + commission_amount + tax_amount + stamped_amount +
        tax_perception_amount + gross_income_perception_amount
    end

		def set_expire_at
      self.expire_at = calculate_expire_at
    end

		def calculate_commission
      self.commission_amount = amount.to_f * percentage_of(:commission)
      self.commission_amount = credit_line.commission_max if commission_amount > credit_line.commission_max
    end

    def calculate_tax
      self.tax_amount = commission_amount * percentage_of(:tax)
    end

		 def calculate_gross_income_perception
      self.gross_income_perception_amount = 0

      if commission_amount > credit_line.gross_income_perception_min
        self.gross_income_perception_amount = commission_amount * percentage_of(:gross_income_perception)
      end
    end

    def calculate_tax_perception
      self.tax_perception_amount = (commission_amount + tax_amount + stamped_amount) * percentage_of(:tax_perception)
    end

    def calculate_stamped
      self.stamped_amount = (amount + commission_amount + tax_amount) * percentage_of(:stamped)
    end

    def set_data
      attrs = [
        'id', 'name', 'commission', 'commission_max', 'interest', 'tax', 'tax_perception',
        'gross_income_perception', 'gross_income_perception_min', 'insurance', 'stamped'
      ]
      self.data = { credit_line: credit_line.attributes.slice(*attrs) }
    end
end
