json.array!(@employees) do |employee|
  json.extract! employee, :id
  json.label employee.label
end
