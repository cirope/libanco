json.array!(@customers) do |customer|
  json.extract! customer, :id
  json.label customer.to_s
end
