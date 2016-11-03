json.extract! member_payment, :id, :amount, :paid_at, :expire_at, :customer_id, :created_at, :updated_at
json.url member_payment_url(member_payment, format: :json)