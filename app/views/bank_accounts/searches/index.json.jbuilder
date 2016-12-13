json.array!(@bank_accounts) do |bank_account|
  json.extract! bank_account, :id
  json.label bank_account.to_s
end
