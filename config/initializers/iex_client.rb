IEX::Api.configure do |config|
  config.publishable_token = 'Tpk_313d2a2bc4de4bed9dfc93d844e2dffd' # defaults to ENV['IEX_API_PUBLISHABLE_TOKEN']
  config.endpoint = 'https://sandbox.iexapis.com/v1' # defaults to 'https://cloud.iexapis.com/v1'
end