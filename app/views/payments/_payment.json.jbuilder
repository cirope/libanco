json.extract! payment, :id, :number, :capital, :interest, :tax, :tax_perception, :gross_income_perception, :insurance, :balance, :amount, :expire_at, :paid_at, :loan_id, :created_at, :updated_at
json.url payment_url(payment, format: :json)