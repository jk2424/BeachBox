# Rails.configuration.stripe = {
#   :publishable_key => Rails.application.credentials.dig(:stripe, :publishable_key),
#   :secret_key      => Rails.application.credentials.dig(:stripe, :secret_key)
# }
# Create a new Postmates client
$client = Postmates.new

# Set basic config variables
$client.configure do |config|
  config.api_key = '2b203200-f6e2-4dc2-b921-ea4f789dfc27'
  config.customer_id = 'cus_Lj6510Jd-FyIok'
end
