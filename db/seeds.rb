# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the bin/rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: "Star Wars" }, { name: "Lord of the Rings" }])
#   Character.create(name: "Luke", movie: movies.first)
# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the bin/rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: "Star Wars" }, { name: "Lord of the Rings" }])
#   Character.create(name: "Luke", movie: movies.first)

User.create(email: 'test@test.com', password: 'test@test.com', name: "Test TEST")


currency_attributes = [
  { name: "US Dollar", symbol: "$", code: "USD" },
  { name: "UAE dirham", symbol: "د.إ", code: "AED" },
  { name: "Canadian Dollar", symbol: "$", code: "CAD" },
  { name: "Pound Sterling", symbol: "£", code: "GBP" },
  { name: "Euro", symbol: "€", code: "EUR" },
  { name: "Yen", symbol: "¥", code: "JPY" },
  { name: "Australian Dollar", symbol: "$", code: "AUD" },
  { name: "Chinese Yuan", symbol: "¥", code: "CNY" },
  { name: "Mexican Peso", symbol: "$", code: "MXN" },
  { name: "Brazillian Real", symbol: "R$", code: "BRL" },
  { name: "Colombian Peso", symbol: "$", code: "COP" },
  { name: "Argentine Peso", symbol: "$", code: "ARS" },
]

currency_attributes.each do |attr_params|
  Currency.find_or_create_by!(attr_params)
end

currencies = Currency.all

marketplace_attributes = [
  { name: "Amazon", url: "https://www.amazon.com/", currency_code: "USD", code: 'US', region: 'north_america', ext_identifier: 'ATVPDKIKX0DER', tld: 'com' },
  { name: "Amazon AU", url: "https://www.amazon.com.au/", currency_code: "AUD" , code: 'AU', region: 'far_east', ext_identifier: 'A39IBJ37TRP1C6', tld: 'com.au' },
  { name: "Amazon BR", url: "https://www.amazon.com.br/", currency_code: "BRL", code: 'BR', region: 'north_america', ext_identifier: 'A2Q3Y263D00KWC', tld: 'com.br' },
  { name: "Amazon CA", url: "https://www.amazon.ca/", currency_code: "CAD", code: 'CA', region: 'north_america', ext_identifier: 'A2EUQ1WTGCTBG2', tld: 'ca' },
  { name: "Amazon DE", url: "https://www.amazon.de/", currency_code: "EUR", code: 'DE', region: 'europe', ext_identifier: 'A1PA6795UKMFR9', tld: 'de' },
  { name: "Amazon ES", url: "https://www.amazon.es/", currency_code: "EUR", code: 'ES', region: 'europe', ext_identifier: 'A1RKKUPIHCS9HS', tld: 'es' },
  { name: "Amazon FR", url: "https://www.amazon.fr/", currency_code: "EUR", code: 'FR', region: 'europe', ext_identifier: 'A13V1IB3VIYZZH', tld: 'fr' },
  { name: "Amazon IT", url: "https://www.amazon.it/", currency_code: "EUR", code: 'IT', region: 'europe', ext_identifier: 'APJ6JRA9NG5V4', tld: 'it' },
  { name: "Amazon JP", url: "https://www.amazon.co.jp/", currency_code: "JPY", code: 'JP', region: 'far_east', ext_identifier: 'A1VC38T7YXB528', tld: 'co.jp' },
  { name: "Amazon MX", url: "https://www.amazon.com.mx/", currency_code: "COP", code: 'MX', region: 'north_america', ext_identifier: 'A1AM78C64UM0Y8', tld: 'mx' },
  { name: "Amazon UK", url: "https://www.amazon.co.uk/", currency_code: "GBP", code: 'UK', region: 'europe', ext_identifier: 'A1F83G8C2ARO7P', tld: 'co.uk' },
]


marketplace_attributes.each do |attr_params|
  currency = currencies.find_by(code: attr_params[:currency_code])
  marketplace = currency.marketplaces.new(attr_params.except(:currency_code))
  Marketplace.find_or_create_by!(marketplace.attributes.except("id","created_at","updated_at"))
end

marketplaces = Marketplace.all

account_attributes = [
  { name: "BALLS CO", marketplace_code: "US", entity_id: "ENTITY18I5M1G4GRYRD" },
  { name: "BALLS CO", marketplace_code: "UK", entity_id: "ENTITY1RJH47TYLDZ6O" },
  { name: "Beam Organics", marketplace_code: "US", entity_id: "ENTITY7BVGR5VBLEWO" },
  { name: "Gozney", marketplace_code: "DE", entity_id: "ENTITY1TBE4ISK260RP" },
  { name: "Purple", marketplace_code: "US", entity_id: "ENTITY1MAEFJO4V7UVO" },
]

account_attributes.each do |attr_params|
  marketplace = marketplaces.find_by(code: attr_params[:marketplace_code])
  account = marketplace.accounts.new(attr_params.except(:marketplace_code))
  Account.find_or_create_by!(account.attributes.except("id","created_at","updated_at"))
end


