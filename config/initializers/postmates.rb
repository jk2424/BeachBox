# Rails.configuration.stripe = {
#   :publishable_key => Rails.application.credentials.dig(:stripe, :publishable_key),
#   :secret_key      => Rails.application.credentials.dig(:stripe, :secret_key)
# }
# Create a new Postmates client
$client = Postmates.new

# Set basic config variables
$client.configure do |config|
  config.api_key = '90be75c0-2ad7-48bc-b4f3-228995b96cff'
  config.customer_id = 'cus_Lj6510Jd-FyIok'
end
