json.array!(@manager_check_rules) do |manager_check_rule|
  json.extract! manager_check_rule, :id, :name, :description, :applid
  json.url manager_check_rule_url(manager_check_rule, format: :json)
end
