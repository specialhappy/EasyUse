json.array!(@check_rules) do |check_rule|
  json.extract! check_rule, :id, :name, :description
  json.url check_rule_url(check_rule, format: :json)
end
