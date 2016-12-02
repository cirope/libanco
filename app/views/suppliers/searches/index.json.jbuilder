json.array!(@suppliers) do |supplier|
  json.extract! supplier, :id
  json.label supplier.label
end
