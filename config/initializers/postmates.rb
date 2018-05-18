# Rails.configuration.stripe = {
#   :publishable_key => Rails.application.credentials.dig(:stripe, :publishable_key),
#   :secret_key      => Rails.application.credentials.dig(:stripe, :secret_key)
# }
# Create a new Postmates client
$client = Postmates.new

# Set basic config variables

$client.configure do |config|
  config.api_key = Rails.application.credentials.dig(:postmates, :api_key),
  config.customer_id = Rails.application.credentials.dig(:postmates, :customer_id)
end
