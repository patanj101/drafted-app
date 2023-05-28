####
#### results
####

json.array!(@accounts) do |result|
  json.name result.name
  json.marketplace_code result.marketplace.code
  json.entity_id result.entity_id
end
